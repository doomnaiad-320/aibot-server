import{d as G,c as O,o as s,C as p,w as t,m as o,b as l,e as u,p as _,G as x,a as b,F as S,I as U,E as q,J as A,q as J,v as T,x as H}from"./index-B2xNDy79.js";import{E as K,a as L}from"./el-form-item-DlU85AZK.js";import{_ as M}from"./index-BuNto3DN.js";import{_ as P}from"./picker-qQ9YEtJl.js";import{D as Q,_ as W}from"./picker-Cd5l2hZ5.js";import{E as X}from"./el-card-DpH4mUSc.js";/* empty css                       */import{E as Y,a as Z}from"./el-radio-CKcO4hVq.js";import{c as h}from"./index-DSiy6YVt.js";import"./_baseClone-CdezRMKA.js";import"./_Uint8Array-0jgVjd-W.js";import"./_initCloneObject-C-h6JGU9.js";import"./index-DFOp_83R.js";import"./index-C6Cr8aHe.js";import"./index.vue_vue_type_script_setup_true_lang-DUdeBZfj.js";import"./el-tag-CuODyGk4.js";import"./isEqual-CLGO95LP.js";import"./el-select-BRdnbwTl.js";import"./index-CcX0CyWL.js";import"./token-DI9FKtlJ.js";import"./el-table-column-DG3vRCd5.js";import"./el-checkbox-3_Bu4Dnb.js";import"./article-Dwgm3r-g.js";import"./usePaging-Dm2wALfy.js";import"./index-BhVAe0P7.js";import"./el-tree-8o9N7gsQ.js";import"./index.vue_vue_type_script_setup_true_lang-B8J7_re8.js";import"./el-popover-Bpu4paqp.js";const ee={class:"flex items-end"},te={key:0,class:"text-xs text-tx-secondary ml-2"},oe={key:1,class:"text-xs text-tx-secondary ml-2"},le={class:"flex-1"},ae={class:"bg-fill-light w-full p-4 mt-4"},ne={class:"flex justify-center w-[467px]"},se={class:"flex-1"},de={class:"flex-1 flex items-center"},me={class:"drag-move cursor-move ml-auto"},ie={key:0,class:"mt-4"},y=5,pe=G({__name:"attr",props:{content:{type:Object,default:()=>({})},styles:{type:Object,default:()=>({})},type:{type:String,default:"mobile"}},emits:["update:content"],setup(d,{emit:C}){const V=C,f=d,r=O({get:()=>f.content,set:m=>{V("update:content",m)}}),B=()=>{var m;if(((m=f.content.data)==null?void 0:m.length)<y){const e=h(f.content);e.data.push({is_show:"1",image:"",bg:"",name:"",link:{}}),V("update:content",e)}else U.msgError(`最多添加${y}张图片`)},D=m=>{var i;if(((i=f.content.data)==null?void 0:i.length)<=1)return U.msgError("最少保留一张图片");const e=h(f.content);e.data.splice(m,1),V("update:content",e)};return(m,e)=>{const i=Y,k=Z,g=X,v=W,F=P,I=q,w=K,N=A,$=J,j=M,z=T,R=L;return s(),p(R,{"label-width":"70px"},{default:t(()=>[o(g,{shadow:"never",class:"!border-none flex mt-2"},{default:t(()=>[e[5]||(e[5]=l("div",{class:"flex items-end mb-4"},[l("div",{class:"text-base dark:text-[#ffffff] text-[#101010] font-medium"},"展示样式")],-1)),o(k,{modelValue:u(r).style,"onUpdate:modelValue":e[0]||(e[0]=c=>u(r).style=c)},{default:t(()=>[o(i,{value:1},{default:t(()=>e[3]||(e[3]=[_("常规")])),_:1}),o(i,{value:2},{default:t(()=>e[4]||(e[4]=[_("大屏")])),_:1})]),_:1},8,["modelValue"])]),_:1}),d.content.style==1?(s(),p(g,{key:0,shadow:"never",class:"!border-none flex mt-2"},{default:t(()=>[e[8]||(e[8]=l("div",{class:"flex items-end mb-4"},[l("div",{class:"text-base text-[#101010] dark:text-[#ffffff] font-medium"},"背景联动")],-1)),o(k,{modelValue:u(r).bg_style,"onUpdate:modelValue":e[1]||(e[1]=c=>u(r).bg_style=c)},{default:t(()=>[o(i,{value:1},{default:t(()=>e[6]||(e[6]=[_("开启")])),_:1}),o(i,{value:0},{default:t(()=>e[7]||(e[7]=[_("关闭")])),_:1})]),_:1},8,["modelValue"]),e[9]||(e[9]=l("div",{class:"p-[15px] rounded-[8px] bg-[#f3f8ff] text-[#136bdf] mt-2"}," 开启背景联动后，需为轮播图设置背景图，轮播图切换时，背景图也跟随切换，此时该页面自身的“页面背景“设置将失效。 ",-1))]),_:1})):x("",!0),o(g,{shadow:"never",class:"!border-none flex-1 mt-2"},{default:t(()=>{var c;return[l("div",ee,[e[10]||(e[10]=l("div",{class:"text-base text-[#101010] dark:text-[#ffffff] font-medium"},"轮播图片",-1)),d.content.style==1?(s(),b("div",te," 最多添加5张，建议图片尺寸：750px*340px ")):(s(),b("div",oe," 最多添加5张，建议图片尺寸：750px*1100px "))]),l("div",le,[o(u(Q),{class:"draggable",modelValue:u(r).data,"onUpdate:modelValue":e[2]||(e[2]=a=>u(r).data=a),animation:"300",handle:".drag-move","item-key":"index"},{item:t(({element:a,index:E})=>[(s(),p(j,{key:E,onClose:n=>D(E),class:"w-full"},{default:t(()=>[l("div",ae,[l("div",ne,[d.content.style==1?(s(),b(S,{key:0},[o(v,{size:"122px",modelValue:a.image,"onUpdate:modelValue":n=>a.image=n,"upload-class":"bg-body","exclude-domain":""},{upload:t(()=>e[11]||(e[11]=[l("div",{class:"w-[122px] h-[122px] banner-upload-btn"}," 轮播图 ",-1)])),_:2},1032,["modelValue","onUpdate:modelValue"]),d.content.style==1||d.content.bg_style==1?(s(),p(v,{key:0,class:"ml-[40px]",size:"122px",modelValue:a.bg,"onUpdate:modelValue":n=>a.bg=n,"upload-class":"bg-body","exclude-domain":""},{upload:t(()=>e[12]||(e[12]=[l("div",{class:"w-[122px] h-[122px] banner-upload-btn"}," 背景图 ",-1)])),_:2},1032,["modelValue","onUpdate:modelValue"])):x("",!0)],64)):(s(),p(v,{key:1,width:"396px",height:"196px",modelValue:a.image,"onUpdate:modelValue":n=>a.image=n,"upload-class":"bg-body","exclude-domain":""},null,8,["modelValue","onUpdate:modelValue"]))]),l("div",se,[o(w,{class:"mt-[18px]",label:"图片链接"},{default:t(()=>[d.type=="mobile"?(s(),p(F,{key:0,modelValue:a.link,"onUpdate:modelValue":n=>a.link=n},null,8,["modelValue","onUpdate:modelValue"])):x("",!0),d.type=="pc"?(s(),p(I,{key:1,placeholder:"请输入链接",modelValue:a.link.path,"onUpdate:modelValue":n=>a.link.path=n},null,8,["modelValue","onUpdate:modelValue"])):x("",!0)]),_:2},1024),o(w,{label:"是否显示",class:"mt-[18px] !mb-0"},{default:t(()=>[l("div",de,[o(N,{modelValue:a.is_show,"onUpdate:modelValue":n=>a.is_show=n,"active-value":"1","inactive-value":"0"},null,8,["modelValue","onUpdate:modelValue"]),l("div",me,[o($,{name:"el-icon-Rank",size:"18"})])])]),_:2},1024)])])]),_:2},1032,["onClose"]))]),_:1},8,["modelValue"])]),((c=d.content.data)==null?void 0:c.length)<y?(s(),b("div",ie,[o(z,{class:"w-full",type:"primary",onClick:B},{default:t(()=>e[13]||(e[13]=[_("添加图片")])),_:1})])):x("",!0)]}),_:1})]),_:1})}}}),Se=H(pe,[["__scopeId","data-v-3e6394fe"]]);export{Se as default};
