import{d as N,i as p,V as L,ew as M,o as a,a as w,m,w as i,b as s,ao as x,U,C as f,e as v,D as c,F as $,r as F,p as k,E as O,v as P}from"./index-B2xNDy79.js";import{E as A}from"./el-popover-Bpu4paqp.js";import"./el-tag-CuODyGk4.js";import{E as D,a as I}from"./el-select-BRdnbwTl.js";const R={class:"popover-input__input mr-[10px] flex-1"},T={class:"popover-input__btns flex-none"},J=N({__name:"index",props:{value:{type:String},type:{type:String,default:"text"},width:{type:[Number,String],default:"300px"},placeholder:String,disabled:{type:Boolean,default:!1},options:{type:Array,default:()=>[]},size:{type:String,default:"default"},limit:{type:Number,default:200},showLimit:{type:Boolean,default:!1},teleported:{type:Boolean,default:!0}},emits:["confirm"],setup(t,{emit:E}){const y=t,V=E,n=p(!1),r=p(!1),o=p(),g=()=>{u(),V("confirm",o.value)},z=()=>{y.disabled||(n.value=!0)},u=()=>{n.value=!1};return L(()=>y.value,d=>{o.value=d},{immediate:!0}),M(document.documentElement,"click",()=>{r.value||u()}),(d,e)=>{const B=D,C=I,S=O,b=P,h=A;return a(),w("div",{onMouseenter:e[4]||(e[4]=l=>r.value=!0),onMouseleave:e[5]||(e[5]=l=>r.value=!1)},[m(h,{placement:"top",visible:v(n),"onUpdate:visible":e[3]||(e[3]=l=>c(n)?n.value=l:null),width:t.width,trigger:"contextmenu",class:"popover-input",teleported:t.teleported,persistent:!1,"popper-class":"!p-0"},{reference:i(()=>[s("div",{class:"inline",onClick:x(z,["stop"])},[U(d.$slots,"default")])]),default:i(()=>[s("div",{class:"flex p-3",onClick:e[2]||(e[2]=x(()=>{},["stop"]))},[s("div",R,[t.type=="select"?(a(),f(C,{key:0,class:"flex-1",size:t.size,modelValue:v(o),"onUpdate:modelValue":e[0]||(e[0]=l=>c(o)?o.value=l:null),teleported:t.teleported},{default:i(()=>[(a(!0),w($,null,F(t.options,l=>(a(),f(B,{key:l.value,label:l.label,value:l.value},null,8,["label","value"]))),128))]),_:1},8,["size","modelValue","teleported"])):(a(),f(S,{key:1,modelValue:v(o),"onUpdate:modelValue":e[1]||(e[1]=l=>c(o)?o.value=l:null),modelModifiers:{trim:!0},maxlength:t.limit,"show-word-limit":t.showLimit,type:t.type,size:t.size,clearable:"",placeholder:t.placeholder},null,8,["modelValue","maxlength","show-word-limit","type","size","placeholder"]))]),s("div",T,[m(b,{link:"",onClick:u},{default:i(()=>e[6]||(e[6]=[k("取消")])),_:1}),m(b,{type:"primary",size:t.size,onClick:g},{default:i(()=>e[7]||(e[7]=[k("确定")])),_:1},8,["size"])])])]),_:3},8,["visible","width","teleported"])],32)}}});export{J as _};
