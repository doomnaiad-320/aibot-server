import{_ as D}from"./index-onOHNH0j.js";import{d as v,g as F,h as M,j as b,M as N,s as $,i as j,k as I,o as S,a as z,m as a,w as l,e as t,b as m,p as w,f9 as A,fa as G,fb as H,fc as J,E as L,J as O,v as P}from"./index-B2xNDy79.js";import{E as K,a as Q}from"./el-form-item-DlU85AZK.js";import{E as W,a as X}from"./el-table-column-DG3vRCd5.js";import"./el-checkbox-3_Bu4Dnb.js";import"./el-tag-CuODyGk4.js";/* empty css                       */import{E as Y,a as Z}from"./el-radio-CKcO4hVq.js";import{E as ee}from"./el-card-DpH4mUSc.js";import{E as ae}from"./el-page-header-Bl6Tm5XX.js";import"./_baseClone-CdezRMKA.js";import"./_Uint8Array-0jgVjd-W.js";import"./_initCloneObject-C-h6JGU9.js";import"./isEqual-CLGO95LP.js";const oe={class:"article-edit"},te={class:"w-80"},le={class:"w-80"},se={class:"w-80"},ne={class:"w-80"},re={class:"w-80"},de=v({name:"scheduledTaskEdit"}),he=v({...de,setup(me){const i=F(),V=M(),o=b({id:"",name:"",command:"",expression:"",params:"",remark:"",status:1,type:1}),{removeTab:E}=N(),u=$(),x=b({name:[{required:!0,message:"请输入名称"}],command:[{required:!0,message:"请输入thankphp命令，如vresion"}],expression:[{required:!0,message:"请输入crontab规则，例：5 9 * * *"}]}),y=async()=>{const n=await A({id:i.query.id});Object.keys(o).forEach(e=>{o[e]=n[e]})},p=j([]),c=async()=>{var e;await((e=u.value)==null?void 0:e.validateField(["expression"]));const n=await G({expression:o.expression});p.value=n},k=async()=>{var n;await((n=u.value)==null?void 0:n.validate()),i.query.id?await H(o):await J(o),E(),V.back()};return I(async()=>{i.query.id&&(await y(),await c())}),(n,e)=>{const h=ae,_=ee,d=L,r=K,g=Y,R=Z,U=O,f=W,q=X,B=Q,T=P,C=D;return S(),z("div",oe,[a(_,{class:"!border-none",shadow:"never"},{default:l(()=>[a(h,{content:n.$route.meta.title,onBack:e[0]||(e[0]=s=>n.$router.back())},null,8,["content"])]),_:1}),a(_,{class:"mt-4 !border-none",shadow:"never"},{default:l(()=>[a(B,{ref_key:"formRef",ref:u,class:"ls-form",model:t(o),"label-width":"85px",rules:t(x)},{default:l(()=>[a(r,{label:"名称",prop:"name"},{default:l(()=>[m("div",te,[a(d,{modelValue:t(o).name,"onUpdate:modelValue":e[1]||(e[1]=s=>t(o).name=s),placeholder:"请输入名称",maxlength:"30",clearable:""},null,8,["modelValue"])])]),_:1}),a(r,{label:"类型",prop:"type"},{default:l(()=>[a(R,{modelValue:t(o).type,"onUpdate:modelValue":e[2]||(e[2]=s=>t(o).type=s)},{default:l(()=>[a(g,{value:1},{default:l(()=>e[8]||(e[8]=[w("定时任务")])),_:1})]),_:1},8,["modelValue"])]),_:1}),a(r,{label:"命令",prop:"command"},{default:l(()=>[m("div",le,[a(d,{modelValue:t(o).command,"onUpdate:modelValue":e[3]||(e[3]=s=>t(o).command=s),placeholder:"请输入thinkphp命令，如vresion",clearable:""},null,8,["modelValue"])])]),_:1}),a(r,{label:"参数",prop:"params"},{default:l(()=>[m("div",se,[a(d,{modelValue:t(o).params,"onUpdate:modelValue":e[4]||(e[4]=s=>t(o).params=s),placeholder:"请输入参数，例:--id 8 --name 测试",clearable:""},null,8,["modelValue"])])]),_:1}),a(r,{label:"状态"},{default:l(()=>[a(U,{modelValue:t(o).status,"onUpdate:modelValue":e[5]||(e[5]=s=>t(o).status=s),"active-value":1,"inactive-value":2},null,8,["modelValue"])]),_:1}),a(r,{label:"规则",prop:"expression"},{default:l(()=>[m("div",ne,[a(d,{onBlur:c,modelValue:t(o).expression,"onUpdate:modelValue":e[6]||(e[6]=s=>t(o).expression=s),placeholder:"请输入crontab规则，例：5 9 * * *"},null,8,["modelValue"])])]),_:1}),a(r,null,{default:l(()=>[a(q,{data:t(p),style:{"max-width":"320px"}},{default:l(()=>[a(f,{prop:"time",label:"序号","min-width":"80"}),a(f,{prop:"date",label:"执行时间","min-width":"240"})]),_:1},8,["data"])]),_:1}),a(r,{label:"备注",prop:"remark"},{default:l(()=>[m("div",re,[a(d,{modelValue:t(o).remark,"onUpdate:modelValue":e[7]||(e[7]=s=>t(o).remark=s),type:"textarea",autosize:{minRows:3,maxRows:6},maxlength:200,"show-word-limit":"",clearable:""},null,8,["modelValue"])])]),_:1})]),_:1},8,["model","rules"])]),_:1}),a(C,null,{default:l(()=>[a(T,{type:"primary",onClick:k},{default:l(()=>e[9]||(e[9]=[w("保存")])),_:1})]),_:1})])}}});export{he as default};
