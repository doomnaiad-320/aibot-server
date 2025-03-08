import{d as N,g as J,i as P,s as M,j as R,z as Q,o as s,a as E,m as t,w as a,e as l,F as W,r as X,C as r,n as Y,p as m,b as V,B as v,D as Z,G as ee,H as L,I as te,E as ae,v as le,q as oe,K as ne}from"./index-B2xNDy79.js";import{_ as se}from"./index.vue_vue_type_script_setup_true_lang-DUdeBZfj.js";import{E as ie,a as de}from"./el-table-column-DG3vRCd5.js";import"./el-checkbox-3_Bu4Dnb.js";import"./el-tag-CuODyGk4.js";import{E as re}from"./el-card-DpH4mUSc.js";import{E as me,a as pe}from"./el-form-item-DlU85AZK.js";import{E as ue,a as ce}from"./el-select-BRdnbwTl.js";import{E as _e}from"./el-page-header-Bl6Tm5XX.js";import{c as fe,e as ye,f as ve}from"./dict-DX85lXc6.js";import{u as ge}from"./usePaging-Dm2wALfy.js";import{_ as be}from"./edit.vue_vue_type_script_setup_true_lang-mfab9SSd.js";import{E as ke}from"./index-CcX0CyWL.js";import"./isEqual-CLGO95LP.js";import"./_Uint8Array-0jgVjd-W.js";import"./_initCloneObject-C-h6JGU9.js";import"./_baseClone-CdezRMKA.js";import"./token-DI9FKtlJ.js";/* empty css                       */import"./el-radio-CKcO4hVq.js";import"./index-DFOp_83R.js";import"./index-C6Cr8aHe.js";const we={class:"dict-type"},Ce={class:"mt-4"},Ee={class:"flex justify-end mt-4"},Ve=N({name:"dictData"}),Me=N({...Ve,setup(De){const{query:S}=J(),g=P(!1),_=M(),i=R({type:"",type_id:Number(S.id),name:"",status:""}),w=R({dict_type:[]}),{pager:f,getLists:y,resetPage:D,resetParams:I}=ge({fetchFun:ve,params:i}),C=P([]),K=n=>{C.value=n.map(({id:e})=>e)},U=async()=>{var e,p;g.value=!0,await L();const n=w.dict_type.find(u=>u.id==i.type_id);(e=_.value)==null||e.setFormData({type_value:n==null?void 0:n.type,type_id:n.id}),(p=_.value)==null||p.open("add")},q=async n=>{var e,p;g.value=!0,await L(),(e=_.value)==null||e.open("edit"),(p=_.value)==null||p.setFormData(n)},x=async n=>{await te.confirm("确定要删除？"),await fe({id:n}),y()},h=async()=>{const n=await ye({page_type:0});w.dict_type=n.lists};return y(),h(),(n,e)=>{const p=_e,u=ue,$=ce,b=me,j=ae,c=le,z=pe,B=re,F=oe,d=ie,T=ke,H=de,A=se,k=Q("perms"),G=ne;return s(),E("div",we,[t(B,{class:"!border-none",shadow:"never"},{default:a(()=>[t(p,{class:"mb-4",content:"数据管理",onBack:e[0]||(e[0]=o=>n.$router.back())}),t(z,{ref:"formRef",class:"mb-[-16px]",model:l(i),inline:""},{default:a(()=>[t(b,{class:"w-[280px]",label:"字典名称"},{default:a(()=>[t($,{modelValue:l(i).type_id,"onUpdate:modelValue":e[1]||(e[1]=o=>l(i).type_id=o),onChange:l(y)},{default:a(()=>[(s(!0),E(W,null,X(l(w).dict_type,o=>(s(),r(u,{label:o.name,value:o.id,key:o.id},null,8,["label","value"]))),128))]),_:1},8,["modelValue","onChange"])]),_:1}),t(b,{class:"w-[280px]",label:"数据名称"},{default:a(()=>[t(j,{modelValue:l(i).name,"onUpdate:modelValue":e[2]||(e[2]=o=>l(i).name=o),clearable:"",onKeyup:Y(l(D),["enter"])},null,8,["modelValue","onKeyup"])]),_:1}),t(b,{class:"w-[280px]",label:"数据状态"},{default:a(()=>[t($,{modelValue:l(i).status,"onUpdate:modelValue":e[3]||(e[3]=o=>l(i).status=o)},{default:a(()=>[t(u,{label:"全部",value:""}),t(u,{label:"正常",value:1}),t(u,{label:"停用",value:0})]),_:1},8,["modelValue"])]),_:1}),t(b,null,{default:a(()=>[t(c,{type:"primary",onClick:l(D)},{default:a(()=>e[7]||(e[7]=[m("查询")])),_:1},8,["onClick"]),t(c,{onClick:l(I)},{default:a(()=>e[8]||(e[8]=[m("重置")])),_:1},8,["onClick"])]),_:1})]),_:1},8,["model"])]),_:1}),t(B,{class:"!border-none mt-4",shadow:"never"},{default:a(()=>[V("div",null,[v((s(),r(c,{type:"primary",onClick:U},{icon:a(()=>[t(F,{name:"el-icon-Plus"})]),default:a(()=>[e[9]||(e[9]=m(" 添加数据 "))]),_:1})),[[k,["setting.dict.dict_data/add"]]]),v((s(),r(c,{disabled:!l(C).length,type:"danger",onClick:e[4]||(e[4]=o=>x(l(C)))},{icon:a(()=>[t(F,{name:"el-icon-Delete"})]),default:a(()=>[e[10]||(e[10]=m(" 删除 "))]),_:1},8,["disabled"])),[[k,["setting.dict.dict_data/delete"]]])]),v((s(),E("div",Ce,[V("div",null,[t(H,{data:l(f).lists,size:"large",onSelectionChange:K},{default:a(()=>[t(d,{type:"selection",width:"55"}),t(d,{label:"ID",prop:"id"}),t(d,{label:"数据名称",prop:"name","min-width":"120"}),t(d,{label:"数据值",prop:"value","min-width":"120"}),t(d,{label:"状态"},{default:a(({row:o})=>[o.status==1?(s(),r(T,{key:0},{default:a(()=>e[11]||(e[11]=[m("正常")])),_:1})):(s(),r(T,{key:1,type:"danger"},{default:a(()=>e[12]||(e[12]=[m("停用")])),_:1}))]),_:1}),t(d,{label:"备注",prop:"remark","min-width":"120","show-tooltip-when-overflow":""}),t(d,{label:"排序",prop:"sort"}),t(d,{label:"操作",width:"120",fixed:"right"},{default:a(({row:o})=>[v((s(),r(c,{link:"",type:"primary",onClick:O=>q(o)},{default:a(()=>e[13]||(e[13]=[m(" 编辑 ")])),_:2},1032,["onClick"])),[[k,["setting.dict.dict_data/edit"]]]),v((s(),r(c,{link:"",type:"danger",onClick:O=>x(o.id)},{default:a(()=>e[14]||(e[14]=[m(" 删除 ")])),_:2},1032,["onClick"])),[[k,["setting.dict.dict_data/delete"]]])]),_:1})]),_:1},8,["data"])]),V("div",Ee,[t(A,{modelValue:l(f),"onUpdate:modelValue":e[5]||(e[5]=o=>Z(f)?f.value=o:null),onChange:l(y)},null,8,["modelValue","onChange"])])])),[[G,l(f).loading]])]),_:1}),l(g)?(s(),r(be,{key:0,ref_key:"editRef",ref:_,onSuccess:l(y),onClose:e[6]||(e[6]=o=>g.value=!1)},null,8,["onSuccess"])):ee("",!0)])}}});export{Me as default};
