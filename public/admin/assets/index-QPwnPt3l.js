import{_ as N}from"./index-onOHNH0j.js";import{d as w,j as C,i as v,c as l,V as E,z as B,o as _,a as I,b as O,m as n,w as c,e as i,D,B as U,C as h,p as k,eV as J,v as R,x as W}from"./index-B2xNDy79.js";import{E as j}from"./el-card-DpH4mUSc.js";import{a as z,s as H}from"./decoration-C6Bzwzfj.js";import{_ as $}from"./attr-setting.vue_vue_type_script_setup_true_lang-BTvRoJfb.js";import q from"./menu-D52yGhgE.js";import A from"./preview-DQqczVec.js";import{e as F}from"./index-JqFibg1v.js";import"./index-DSiy6YVt.js";import"./_baseClone-CdezRMKA.js";import"./_Uint8Array-0jgVjd-W.js";import"./_initCloneObject-C-h6JGU9.js";import"./isEqual-CLGO95LP.js";import"./index-C6Cr8aHe.js";import"./attr-Bqhk7AF3.js";import"./el-form-item-DlU85AZK.js";import"./index-BuNto3DN.js";import"./picker-qQ9YEtJl.js";import"./index-DFOp_83R.js";import"./index.vue_vue_type_script_setup_true_lang-DUdeBZfj.js";import"./el-tag-CuODyGk4.js";import"./el-select-BRdnbwTl.js";import"./index-CcX0CyWL.js";import"./token-DI9FKtlJ.js";import"./el-table-column-DG3vRCd5.js";import"./el-checkbox-3_Bu4Dnb.js";import"./article-Dwgm3r-g.js";import"./usePaging-Dm2wALfy.js";/* empty css                       */import"./el-radio-CKcO4hVq.js";import"./picker-Cd5l2hZ5.js";import"./index-BhVAe0P7.js";import"./el-tree-8o9N7gsQ.js";import"./index.vue_vue_type_script_setup_true_lang-B8J7_re8.js";import"./el-popover-Bpu4paqp.js";import"./content.vue_vue_type_script_setup_true_lang-DchKkk1p.js";import"./decoration-img-2F0tdl1c.js";import"./attr.vue_vue_type_script_setup_true_lang-BUnp-W91.js";import"./content-CA3eC6JD.js";import"./attr.vue_vue_type_script_setup_true_lang-_e1mwglx.js";import"./content.vue_vue_type_script_setup_true_lang-BnJOM-Yt.js";import"./attr.vue_vue_type_script_setup_true_lang-D3n1kY8a.js";import"./add-nav.vue_vue_type_script_setup_true_lang-BlUx6EnP.js";import"./content-D3wpKzNH.js";import"./attr.vue_vue_type_script_setup_true_lang-Cv1wbPt-.js";import"./content.vue_vue_type_script_setup_true_lang-CwpJZnDJ.js";import"./attr.vue_vue_type_script_setup_true_lang-DyaVW45d.js";import"./content-CVqMLU2z.js";import"./attr.vue_vue_type_script_setup_true_lang-bDu15G_R.js";import"./index.vue_vue_type_script_setup_true_lang-C-xtr9xT.js";import"./content-DRWnLeOw.js";import"./content.vue_vue_type_script_setup_true_lang-B_7xmKd0.js";import"./el-alert-BUxHh72o.js";import"./attr.vue_vue_type_script_setup_true_lang-DkUoKAk4.js";import"./content-CvSg00F8.js";import"./attr.vue_vue_type_script_setup_true_lang-DD7J54WS.js";import"./content.vue_vue_type_script_setup_true_lang-DXwxhIWi.js";import"./attr.vue_vue_type_script_setup_true_lang-BfAYpuFH.js";import"./content-DdyiS-ri.js";const G={class:"decoration-pages min-w-[1100px]"},K={class:"flex flex-1 h-full justify-between"},L=w({name:"decorationPages"}),Q=w({...L,setup(T){let u;(e=>{e.HOME="1",e.USER="2",e.SERVICE="3"})(u||(u={}));const x=e=>{o[a.value].pageData=[...e]},p=e=>e.map(t=>{var s;return{id:J(),...((s=F[t])==null?void 0:s.options())||{}}}),M=e=>{var t;(t=o[a.value])!=null&&t.pageData&&(o[a.value].pageData[r.value].content=e)},o=C({1:{id:1,type:1,name:"首页装修",pageMeta:p(["page-meta"]),pageData:p(["search","banner","nav","news"])},2:{id:2,type:2,name:"个人中心",pageMeta:p(["page-meta"]),pageData:p(["user-info","my-service","user-banner"])},3:{id:3,type:3,name:"客服设置",pageMeta:null,pageData:p(["customer-service"])}}),a=v("1"),r=v(-1),d=l(()=>{var e;return((e=o[a.value])==null?void 0:e.pageData)??[]}),y=l(()=>{var e;return((e=o[a.value])==null?void 0:e.pageMeta)??null}),V=l(()=>{var e,t;return r.value===-1?((e=o[a.value])==null?void 0:e.pageMeta[0])??"":((t=o[a.value])==null?void 0:t.pageData[r.value])??""}),g=async()=>{const e=await z({id:a.value});o[String(e.id)].pageData=JSON.parse(e.data),o[String(e.id)].pageMeta=e!=null&&e.meta?JSON.parse(e==null?void 0:e.meta):null},b=async()=>{const e=o[a.value];await H({...e,data:JSON.stringify(e.pageData),meta:e!=null&&e.pageMeta?JSON.stringify(e==null?void 0:e.pageMeta):null}),g()};return E(a,()=>{r.value=d.value.findIndex(e=>!e.disabled),g()},{immediate:!0}),(e,t)=>{const f=j,s=R,P=N,S=B("perms");return _(),I("div",G,[O("div",K,[n(f,{shadow:"never",class:"!border-none flex scroll-view-content","body-style":{"padding-right":0}},{default:c(()=>[n(q,{modelValue:i(a),"onUpdate:modelValue":t[0]||(t[0]=m=>D(a)?a.value=m:null),menus:i(o)},null,8,["modelValue","menus"])]),_:1}),n(A,{class:"flex-1 scroll-view-content",modelValue:i(r),"onUpdate:modelValue":t[1]||(t[1]=m=>D(r)?r.value=m:null),onUpdatePageData:x,pageData:i(d),pageMeta:i(y)},null,8,["modelValue","pageData","pageMeta"]),n($,{class:"w-[560px] scroll-view-content",widget:i(V),"onUpdate:content":M},null,8,["widget"])]),U((_(),h(P,{class:"mt-4",fixed:!1},{default:c(()=>[n(s,{type:"primary",onClick:b},{default:c(()=>t[2]||(t[2]=[k("保存")])),_:1})]),_:1})),[[S,["decorate:pages:save"]]])])}}}),at=W(Q,[["__scopeId","data-v-c24d7f45"]]);export{at as default};
