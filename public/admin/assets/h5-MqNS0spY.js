import{_ as H}from"./index-onOHNH0j.js";import{y as E,d as V,j as R,z as w,o as p,a as U,m as o,w as t,e as l,b as d,p as n,C as i,G as q,t as F,B as b,E as G,v as I}from"./index-B2xNDy79.js";import{E as S,a as j}from"./el-form-item-DlU85AZK.js";/* empty css                       */import{E as z,a as A}from"./el-radio-CKcO4hVq.js";import{E as T}from"./el-card-DpH4mUSc.js";import{E as J}from"./el-alert-BUxHh72o.js";import"./_baseClone-CdezRMKA.js";import"./_Uint8Array-0jgVjd-W.js";import"./_initCloneObject-C-h6JGU9.js";function K(_){return E.post({url:"/channel.web_page_setting/setConfig",params:_})}function L(){return E.get({url:"/channel.web_page_setting/getConfig"})}const M={class:"w-80"},O={class:"flex-1 min-w-0 break-words"},P=V({name:"h5Config"}),ae=V({...P,setup(_){const a=R({status:0,page_status:0,page_url:"",url:""}),m=async()=>{const f=await L();for(const e in a)a[e]=f[e]},C=async()=>{await K(a),m()};return m(),(f,e)=>{const y=J,g=T,r=z,c=A,u=S,k=G,v=I,x=j,B=H,D=w("copy"),N=w("perms");return p(),U("div",null,[o(g,{class:"!border-none",shadow:"never"},{default:t(()=>[o(y,{type:"warning",title:"温馨提示：H5设置",closable:!1,"show-icon":""})]),_:1}),o(g,{class:"!border-none mt-4",shadow:"never"},{default:t(()=>[o(x,{ref:"formRef",model:l(a),"label-width":"120px"},{default:t(()=>[o(u,{label:"渠道状态",required:"",prop:"status"},{default:t(()=>[d("div",null,[o(c,{modelValue:l(a).status,"onUpdate:modelValue":e[0]||(e[0]=s=>l(a).status=s)},{default:t(()=>[o(r,{value:1},{default:t(()=>e[3]||(e[3]=[n("开启")])),_:1}),o(r,{value:0},{default:t(()=>e[4]||(e[4]=[n("关闭")])),_:1})]),_:1},8,["modelValue"]),e[5]||(e[5]=d("div",{class:"form-tips"},"状态为关闭时，将不对外提供服务，请谨慎操作",-1))])]),_:1}),o(u,{label:"关闭后访问页面",prop:"page_status"},{default:t(()=>[o(c,{modelValue:l(a).page_status,"onUpdate:modelValue":e[1]||(e[1]=s=>l(a).page_status=s)},{default:t(()=>[o(r,{value:0},{default:t(()=>e[6]||(e[6]=[n("空页面")])),_:1}),o(r,{value:1},{default:t(()=>e[7]||(e[7]=[n("自定义链接")])),_:1})]),_:1},8,["modelValue"])]),_:1}),l(a).page_status==1?(p(),i(u,{key:0,label:"",prop:"page_url"},{default:t(()=>[d("div",M,[o(k,{modelValue:l(a).page_url,"onUpdate:modelValue":e[2]||(e[2]=s=>l(a).page_url=s),placeholder:"请输入完整的url"},null,8,["modelValue"])])]),_:1})):q("",!0),o(u,{label:"访问链接"},{default:t(()=>[d("div",O,[n(F(l(a).url)+" ",1),b((p(),i(v,null,{default:t(()=>e[8]||(e[8]=[n("复制")])),_:1})),[[D,l(a).url]])])]),_:1})]),_:1},8,["model"])]),_:1}),b((p(),i(B,null,{default:t(()=>[o(v,{type:"primary",onClick:C},{default:t(()=>e[9]||(e[9]=[n("保存")])),_:1})]),_:1})),[[N,["channel.web_page_setting/setConfig"]]])])}}});export{ae as default};
