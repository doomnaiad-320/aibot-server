import{at as w,aA as M,d as v,aj as N,an as V,c as $,o as t,a as j,b as l,U as f,Y as o,e as a,C as c,w as r,m as k,ch as g,ao as y,S as b,G as C,as as h,bj as I,ar as P,ay as A}from"./index-B2xNDy79.js";const F=w({type:{type:String,values:["primary","success","info","warning","danger"],default:"primary"},closable:Boolean,disableTransitions:Boolean,hit:Boolean,color:String,size:{type:String,values:M},effect:{type:String,values:["dark","light","plain"],default:"light"},round:Boolean}),G={close:n=>n instanceof MouseEvent,click:n=>n instanceof MouseEvent},K=v({name:"ElTag"}),U=v({...K,props:F,emits:G,setup(n,{emit:i}){const S=n,_=N(),s=V("tag"),u=$(()=>{const{type:e,hit:m,effect:E,closable:z,round:T}=S;return[s.b(),s.is("closable",z),s.m(e||"primary"),s.m(_.value),s.m(E),s.is("hit",m),s.is("round",T)]}),p=e=>{i("close",e)},d=e=>{i("click",e)},B=e=>{e.component.subTree.component.bum=null};return(e,m)=>e.disableTransitions?(t(),j("span",{key:0,class:o(a(u)),style:h({backgroundColor:e.color}),onClick:d},[l("span",{class:o(a(s).e("content"))},[f(e.$slots,"default")],2),e.closable?(t(),c(a(b),{key:0,class:o(a(s).e("close")),onClick:y(p,["stop"])},{default:r(()=>[k(a(g))]),_:1},8,["class","onClick"])):C("v-if",!0)],6)):(t(),c(I,{key:1,name:`${a(s).namespace.value}-zoom-in-center`,appear:"",onVnodeMounted:B},{default:r(()=>[l("span",{class:o(a(u)),style:h({backgroundColor:e.color}),onClick:d},[l("span",{class:o(a(s).e("content"))},[f(e.$slots,"default")],2),e.closable?(t(),c(a(b),{key:0,class:o(a(s).e("close")),onClick:y(p,["stop"])},{default:r(()=>[k(a(g))]),_:1},8,["class","onClick"])):C("v-if",!0)],6)]),_:3},8,["name"]))}});var Y=P(U,[["__file","tag.vue"]]);const D=A(Y);export{D as E,F as t};
