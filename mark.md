# 服务端开发文档
## 一、目录结构
```
server  //服务端根目录（管理后台、接口）
├─app  //应用目录
│  ├─adminapi  //管理后台接口
│  │  ├─config //配置
│  │  ├─controller //控制器
│  │  ├─http
│  │  │  ├─middleware //中间件
│  │  ├─listener //事件监听
│  │  ├─lists //列表类
│  │  ├─logic //逻辑类
│  │  ├─service //服务类
│  │  ├─validate //验证类
│  ├─public  //WEB目录（对外访问目录）
│  │  ├─index.php  //php入口文件
│  │  ├─admin  //已编译的后台前端代码入口（上线运行）
│  │  ├─install  //安装程序目录
│  ├─.env  //项目环境配置文件（最优化读取配置）
```

## 二、运行流程
likadmin采用前后端分离模式，服务端仅提供数据接口，默认访问方式为`http://域名/模块名称/控制器名称/控制器方法`。代码执行流程如下：
1. 根据接口url找到模块，进入模块中间件，中间件顺序在`adminapi/config/route.php`中配置。
2. 进入控制器，查看数据的操作类型控制器一般无验证类，数据提交类型有验证类。
3. 按需求执行逻辑层或列表类或服务层，然后返回结果。
4. 整体流程：接口请求→进入模块→中间件→控制器→[验证类→逻辑层\列表类\服务层]→返回结果。

## 三、模块
按照thinkphp开发规范，一般模块放在`server/app`目录下，根据业务定义模块。likeadmin目前针对管理后台定义了`server/app/adminapi`模块，后续还会有小程序模块等。

## 四、中间件
中间件配置在`adminapi/config/route.php`文件，按顺序运行初始化中间件、登录验证中间件、权限认证中间件。
1. **初始化中间件**：路径为`http/middleware/InitMiddleware.php`，用于模块初始化，一般无需修改。
2. **登录验证中间件**：路径为`adminapi/http/middleware/LoginMiddleware.php`，用于验证用户是否登录。登录用户会在请求的header里放置有效的token参数，通过该参数可获取用户信息，在控制器等地方使用。部分不需要验证登录的接口（如登录接口），可在控制器中设置，示例如下：
```php
namespace app\adminapi\controller;
class LoginController extends BaseAdminController{
    public array $notNeedLogin = ['account', 'logout'];
    public function account(){}
    public function logout(){}
}
```
3. **权限认证中间件**：路径为`adminapi/http/middleware/AuthMiddleware.php`，用于验证登录账号的角色是否拥有该接口的访问权限。

## 五、控制器
1. **访问**：控制器目录在【模块/controller】，可直接在`controller`目录新增控制器类，访问路径为`http://域名/模块/控制器类名称/控制器方法`；也可在`controller`再新建控制器目录和控制器，访问路径为`http://域名/模块/控制器目录.控制器名称/控制器方法`。
2. **继承**：一般情况下，控制器需继承模块的基础控制器。管理后台模块的控制器继承`BaseAdminController`控制器，在用户登录状态下，可通过`$this->adminId`获取管理员id，`$this->adminInfo`获取管理员信息。
3. **登录**：默认控制器方法需登录才能访问，也可设置控制器的`$notNeedLogin`属性，添加多个不需要登录验证的控制器方法名称。
4. **响应**：为规范接口返回值，接口数据格式与前端约定如下：
```json
{
    "code": 1,
    "show": 0,
    "msg": "",
    "data": {
        "lists": [],
        "count": 0,
        "page_no": 1,
        "page_size": 15,
        "extend": []
    }
}
```
|字段|名称|类型|必显|说明|
|---|---|---|---|---|
|code|状态码|int|是|1-业务正常；0-业务验证不通过|
|show|提示状态|int|是|1-显示提示语内容；0-不显示提示内容|
|msg|提示语|string|是|轻弹窗出提示|
|data|数据|object|是|业务数据|
|- list|列表数组|array|否|数据列表数组内容|
|- count|记录数|int|否|数据列表总记录数|
|- page_no|页面序号|int|否|当前页序号|
|- page_size|每页记录数|int|否|当前每页记录数|
|- extend|额外参数|array|否|额外参数，按需使用|
5. 接口返回一般使用控制器的几个方法：
|方法名称|调用说明|参数|
|---|---|---|
|success()|返回业务正常或数据|`$msg`:提示语;`$data`:数据;`$code`:状态码;`$show`:提示语|
|data()|返回数据|`$data`:数据|
|lists()|返回列表数据|`$lists`: 列表类|
|fail()|返回数据|`$msg`:提示语;验证码拦截后会自动处理，一般无需使用|

## 六、验证类
在获取请求参数后进行简单的参数校验。
1. **实现步骤**：业务验证类继承`BaseValidate`验证基类；业务控制器实例化业务验证类，调用`goCheck($scene, $validateData)`方法。
2. **示例**：
```php
// 验证器
namespace app\adminapi\validate\auth;
use app\common\validate\BaseValidate;
class AdminValidate extends BaseValidate{
    protected $rule = [
        'name' => 'require',
    ];
    protected $message = [
        'name.require' => '名称不能为空',
    ];
    // 添加场景
    public function sceneAdd(){
        return $this->only(['name']);
    }
}
// 控制器
namespace app\adminapi\controller\auth;
use app\adminapi\controller\BaseAdminController;
use app\adminapi\validate\auth\AdminValidate;
class AdminController extends BaseAdminController{
    public function add(){
        // gocheck($scene, $validateData)
        // $scene => 场景 $validateData => 验证参数(可追加或覆盖接收到的请求参数)
        // post
        $params = (new AdminValidate())->post()->goCheck('add');
        // get
        // $params = (new AdminValidate())->goCheck('detail');
        //……
    }
}
```

## 七、列表类
1. **实现步骤**：新建列表类继承列表基类`BaseAdminDataLists`；控制器中继承控制器基类`BaseAdminController`，调用`dataLists()`。
2. **其他**：分页使用`limit()`方法；提供了`ListsSearchInterface`（搜索）、`ListsExtendInterface`（扩展参数）、`ListsSortInterface`（排序）、`ListsExcelInterface`（导出Excel）接口加强列表类应用。
3. **示例**：
```php
// 列表类
namespace app\adminapi\lists\auth;
use app\adminapi\lists\BaseAdminDataLists;
use app\common\lists\ListsSearchInterface;
class AdminLists extends BaseAdminDataLists implements ListsSearchInterface{
    // 搜索条件
    public function setSearch(): array{
        return [
            '%like%' => ['name', 'account'],
        ];
    }
    // 查询列表数据
    public function lists(): array{
        return Admin::where($this->searchWhere)
            ->limit($this->limitOffset, $this->limitLength)
            ->select()
            ->toArray();
    }
    // 获取数量
    public function count(): int{
        return Admin::where($this->searchWhere)->count();
    }
}
// 控制器
namespace app\adminapi\controller;
use app\adminapi\controller\BaseAdminController;
use app\adminapi\lists\DemoLists;
class AdminController extends BaseAdminController{
    public function lists(){
        return $this->dataLists(new AdminLists());
    }
}
```

## 八、列表导出
1. **实现步骤**：业务列表类实现`ListsExcelInterface`接口，该接口必须实现`setExcelFields()`（用于设置导出字段）和`setFileName()`（用于设置默认导出文件名）方法；前端请求列表接口时带上导出所需参数。
2. **其他**：导出目录为`server/runtime/file/export/`；导出具体逻辑参考`app/common/lists/ListsExcelTrait.php`。
3. **前端接口请求参数**：
|参数名|必选|类型|说明|
|---|---|---|---|
|export|是|int|2-导出excel|
|file_name|否|string|导出文件名；若不传递，使用后端设置的默认文件名|
|page_type|否|int|导出数据类型 0-导出全部数据 1(默认)-导出指定分页的数据(例：导出第2页至第5页数据时，同时要传递page_start = 2,page_end=5)|
|page_size|否|int|当page_type=1时有效，代表每页的数量， 默认值25|
|page_start|否|int|当page_type=1时有效，代表导出的起始页码， 默认值1|
|page_end|否|int|当page_type=1时有效，代表导出的结束页码， 默认值200|
4. **示例**：
```php
// 列表类
namespace app\adminapi\lists;
use app\adminapi\lists\BaseAdminDataLists;
use app\common\lists\ListsExcelInterface;
class DemoLists extends BaseAdminDataLists implements ListsExcelInterface{
    // 查询列表数据
    public function lists(): array{
        //……
    }
    // 查询数量
    public function count(): int{
        //……
    }
    // 设置导出字段
    public function setExcelFields(): array{
        return [
            'nickname' => '昵称',
            'mobile' => '手机号',
        ];
    }
    // 设置导出文件默认名称
    public function setFileName(): string{
        return '用户记录';
    }
}
// 控制器
namespace app\adminapi\controller;
use app\adminapi\controller\BaseAdminController;
use app\adminapi\lists\DemoLists;
class DemoController extends BaseAdminController{
    public function lists(){
        return $this->dataLists(new DemoLists());
    }
}
```
前端请求列表接口`/adminapi/demo/lists?export=2&page_type=1&page_start=1&page_end=2`，即可获得excel下载地址。

## 九、定时任务
在系统中添加好业务所需定时任务，运行crontab定时任务来处理各子任务。示例中`www/wwwroot/likeshop/server/think`为项目的`think`文件绝对路径，需根据实际项目路径调整。
1. **宝塔**：在计划任务页面中添加crontab定时任务，设置脚本内容：`php /www/wwwroot/likeshop/server/think crontab`。
2. **LINUX**：执行`crontab -e`，设置脚本内容：`*/1 * * * * php /www/wwwroot/likeshop/server/think crontab`。
3. **docker**：进入php容器，设置脚本内容：`*/1 * * * * docker exec likeshop-php-7.2.4-fpm php /likeshop/server/think crontab`。 
