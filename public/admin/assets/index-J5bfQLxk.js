import{d as B,s as H,j as J,i as M,k as Q,z as W,o as s,a as V,m as e,w as l,e as a,n as x,F as X,r as Y,C as r,p as u,B as v,b as D,G as y,D as Z,H as $,I as ee,E as oe,v as te,q as ae,$ as le,J as ne,K as ie}from"./index-B2xNDy79.js";import{_ as se}from"./index.vue_vue_type_script_setup_true_lang-DUdeBZfj.js";import{E as me,a as re}from"./el-table-column-DG3vRCd5.js";import"./el-checkbox-3_Bu4Dnb.js";import"./el-tag-CuODyGk4.js";import{E as de}from"./el-card-DpH4mUSc.js";import{E as pe,a as ue}from"./el-form-item-DlU85AZK.js";import{_ as ce}from"./index.vue_vue_type_script_setup_true_lang-DpKD7KQ8.js";import{E as _e,a as fe}from"./el-select-BRdnbwTl.js";import{a as z,_ as ve,b as be,c as we}from"./edit.vue_vue_type_script_setup_true_lang-CO-_GIwQ.js";import{r as ge}from"./role-BYPWLZ0d.js";import{u as he}from"./useDictOptions-D0QsC3Dl.js";import{u as ke}from"./usePaging-Dm2wALfy.js";import"./isEqual-CLGO95LP.js";import"./_Uint8Array-0jgVjd-W.js";import"./_initCloneObject-C-h6JGU9.js";import"./_baseClone-CdezRMKA.js";/* empty css                       */import"./el-radio-CKcO4hVq.js";import"./index-DFOp_83R.js";import"./index-C6Cr8aHe.js";import"./index-CcX0CyWL.js";import"./token-DI9FKtlJ.js";import"./el-tree-8o9N7gsQ.js";import"./el-tree-select-BPB13nyH.js";import"./picker-Cd5l2hZ5.js";import"./index-BhVAe0P7.js";import"./index-BuNto3DN.js";import"./index-DSiy6YVt.js";import"./index.vue_vue_type_script_setup_true_lang-B8J7_re8.js";import"./el-popover-Bpu4paqp.js";import"./department-v2Z7R8-4.js";import"./post-zozQIMRx.js";const ye={class:"admin"},Ce={class:"mt-4"},Ee={class:"flex mt-4 justify-end"},Ve=B({name:"admin"}),io=B({...Ve,setup(xe){const b=H(),m=J({account:"",name:"",role_id:""}),w=M(!1),{pager:d,getLists:c,resetParams:F,resetPage:k}=ke({fetchFun:z,params:m}),K=n=>{be({id:n.id,avatar:n.avatar,account:n.account,name:n.name,role_id:n.role_id,job_id:n.job_id,dept_id:n.dept_id,disable:n.disable,multipoint_login:n.multipoint_login}).finally(()=>{c()})},U=async()=>{var n;w.value=!0,await $(),(n=b.value)==null||n.open("add")},I=async n=>{var o,_;w.value=!0,await $(),(o=b.value)==null||o.open("edit"),(_=b.value)==null||_.setFormData(n)},P=async n=>{await ee.confirm("确定要删除？"),await we({id:n}),c()},{optionsData:S}=he({role:{api:ge}});return Q(()=>{c()}),(n,o)=>{const _=oe,g=pe,C=_e,j=fe,f=te,L=ce,N=ue,E=de,R=ae,i=me,T=le,A=ne,O=re,q=se,h=W("perms"),G=ie;return s(),V("div",ye,[e(E,{class:"!border-none",shadow:"never"},{default:l(()=>[e(N,{class:"mb-[-16px]",model:a(m),inline:""},{default:l(()=>[e(g,{class:"w-[280px]",label:"管理员账号"},{default:l(()=>[e(_,{modelValue:a(m).account,"onUpdate:modelValue":o[0]||(o[0]=t=>a(m).account=t),placeholder:"请输入管理员账号",clearable:"",onKeyup:x(a(k),["enter"])},null,8,["modelValue","onKeyup"])]),_:1}),e(g,{class:"w-[280px]",label:"管理员名称"},{default:l(()=>[e(_,{modelValue:a(m).name,"onUpdate:modelValue":o[1]||(o[1]=t=>a(m).name=t),placeholder:"请输入管理员名称",clearable:"",onKeyup:x(a(k),["enter"])},null,8,["modelValue","onKeyup"])]),_:1}),e(g,{class:"w-[280px]",label:"管理员角色"},{default:l(()=>[e(j,{modelValue:a(m).role_id,"onUpdate:modelValue":o[2]||(o[2]=t=>a(m).role_id=t)},{default:l(()=>[e(C,{label:"全部",value:""}),(s(!0),V(X,null,Y(a(S).role,(t,p)=>(s(),r(C,{key:p,label:t.name,value:t.id},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1}),e(g,null,{default:l(()=>[e(f,{type:"primary",onClick:a(k)},{default:l(()=>o[5]||(o[5]=[u("查询")])),_:1},8,["onClick"]),e(f,{onClick:a(F)},{default:l(()=>o[6]||(o[6]=[u("重置")])),_:1},8,["onClick"]),e(L,{class:"ml-2.5","fetch-fun":a(z),params:a(m),"page-size":a(d).size},null,8,["fetch-fun","params","page-size"])]),_:1})]),_:1},8,["model"])]),_:1}),v((s(),r(E,{class:"mt-4 !border-none",shadow:"never"},{default:l(()=>[v((s(),r(f,{type:"primary",onClick:U},{icon:l(()=>[e(R,{name:"el-icon-Plus"})]),default:l(()=>[o[7]||(o[7]=u(" 新增 "))]),_:1})),[[h,["auth.admin/add"]]]),D("div",Ce,[e(O,{data:a(d).lists,size:"large"},{default:l(()=>[e(i,{label:"ID",prop:"id","min-width":"60"}),o[10]||(o[10]=u("> ")),e(i,{label:"头像","min-width":"100"},{default:l(({row:t})=>[e(T,{size:50,src:t.avatar},null,8,["src"])]),_:1}),e(i,{label:"账号",prop:"account","min-width":"100"}),e(i,{label:"名称",prop:"name","min-width":"100"}),e(i,{label:"角色",prop:"role_name","min-width":"100","show-tooltip-when-overflow":""}),e(i,{label:"部门",prop:"dept_name","min-width":"100","show-tooltip-when-overflow":""}),e(i,{label:"创建时间",prop:"create_time","min-width":"180"}),e(i,{label:"最近登录时间",prop:"login_time","min-width":"180"}),e(i,{label:"最近登录IP",prop:"login_ip","min-width":"120"}),v((s(),r(i,{label:"状态","min-width":"100"},{default:l(({row:t})=>[t.root!=1?(s(),r(A,{key:0,modelValue:t.disable,"onUpdate:modelValue":p=>t.disable=p,"active-value":0,"inactive-value":1,onChange:p=>K(t)},null,8,["modelValue","onUpdate:modelValue","onChange"])):y("",!0)]),_:1})),[[h,["auth.admin/edit"]]]),e(i,{label:"操作",width:"120",fixed:"right"},{default:l(({row:t})=>[v((s(),r(f,{type:"primary",link:"",onClick:p=>I(t)},{default:l(()=>o[8]||(o[8]=[u(" 编辑 ")])),_:2},1032,["onClick"])),[[h,["auth.admin/edit"]]]),t.root!=1?v((s(),r(f,{key:0,type:"danger",link:"",onClick:p=>P(t.id)},{default:l(()=>o[9]||(o[9]=[u(" 删除 ")])),_:2},1032,["onClick"])),[[h,["auth.admin/delete"]]]):y("",!0)]),_:1})]),_:1},8,["data"])]),D("div",Ee,[e(q,{modelValue:a(d),"onUpdate:modelValue":o[3]||(o[3]=t=>Z(d)?d.value=t:null),onChange:a(c)},null,8,["modelValue","onChange"])])]),_:1})),[[G,a(d).loading]]),a(w)?(s(),r(ve,{key:0,ref_key:"editRef",ref:b,onSuccess:a(c),onClose:o[4]||(o[4]=t=>w.value=!1)},null,8,["onSuccess"])):y("",!0)])}}});export{io as default};
