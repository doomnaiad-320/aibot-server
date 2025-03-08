import{_ as Be}from"./nuxt-link.5da8524b.js";import{_ as Oe}from"./card.vue.d1ff70da.js";import{u as Pe}from"./asyncData.018825d1.js";import{s as ce,y as fe,z as de,A as ve,B as Ve,C as ze,r as b,D as H,k as e,F as X,G as me,H as De,I as Re,J as Ue,K as We,L as he,f as Z,M as pe,o as E,c as z,a as W,m as ee,w as j,N as x,O as V,Q as Y,b as B,R as le,S as je,T as G,U as re,n as F,V as Ke,W as ge,X as _e,Y as ye,Z as Ie,t as Fe,_ as Ce,$ as qe,j as Je,a0 as Qe,a1 as Xe,a2 as Ye,a3 as xe,a4 as Ge,g as Ze}from"./entry.edbe2177.js";import{t as ie,E as et}from"./empty_news.a51f61f1.js";import"./items.vue.6bb962a1.js";import"./debounce.e1664469.js";const tt=(s,_,o)=>fe(s.subTree).filter(l=>{var f;return de(l)&&((f=l.type)==null?void 0:f.name)===_&&!!l.component}).map(l=>l.component.uid).map(l=>o[l]).filter(l=>!!l),at=(s,_)=>{const o={},n=ce([]);return{children:n,addChild:f=>{o[f.uid]=f,n.value=tt(s,_,o)},removeChild:f=>{delete o[f],n.value=n.value.filter(a=>a.uid!==f)}}},st=ve({initialIndex:{type:Number,default:0},height:{type:String,default:""},trigger:{type:String,values:["hover","click"],default:"hover"},autoplay:{type:Boolean,default:!0},interval:{type:Number,default:3e3},indicatorPosition:{type:String,values:["","none","outside"],default:""},arrow:{type:String,values:["always","hover","never"],default:"hover"},type:{type:String,values:["","card"],default:""},loop:{type:Boolean,default:!0},direction:{type:String,values:["horizontal","vertical"],default:"horizontal"},pauseOnHover:{type:Boolean,default:!0}}),nt={change:(s,_)=>[s,_].every(Ve)},we=Symbol("carouselContextKey"),ue=300,ot=(s,_,o)=>{const{children:n,addChild:p,removeChild:l}=at(he(),"ElCarouselItem"),f=ze(),a=b(-1),d=b(null),I=b(!1),v=b(),C=b(0),S=b(!0),$=H(()=>s.arrow!=="never"&&!e(N)),T=H(()=>n.value.some(t=>t.props.label.toString().length>0)),O=H(()=>s.type==="card"),N=H(()=>s.direction==="vertical"),M=H(()=>s.height!=="auto"?{height:s.height}:{height:`${C.value}px`,overflow:"hidden"}),P=ie(t=>{h(t)},ue,{trailing:!0}),K=ie(t=>{te(t)},ue),r=t=>S.value?a.value<=1?t<=1:t>1:!0;function i(){d.value&&(clearInterval(d.value),d.value=null)}function m(){s.interval<=0||!s.autoplay||d.value||(d.value=setInterval(()=>y(),s.interval))}const y=()=>{a.value<n.value.length-1?a.value=a.value+1:s.loop&&(a.value=0)};function h(t){if(We(t)){const U=n.value.filter(D=>D.props.name===t);U.length>0&&(t=n.value.indexOf(U[0]))}if(t=Number(t),Number.isNaN(t)||t!==Math.floor(t))return;const c=n.value.length,L=a.value;t<0?a.value=s.loop?c-1:0:t>=c?a.value=s.loop?0:c-1:a.value=t,L===a.value&&u(L),se()}function u(t){n.value.forEach((c,L)=>{c.translateItem(L,a.value,t)})}function A(t,c){var L,U,D,J;const Q=e(n),ne=Q.length;if(ne===0||!t.states.inStage)return!1;const Te=c+1,$e=c-1,oe=ne-1,Me=Q[oe].states.active,Ae=Q[0].states.active,Le=(U=(L=Q[Te])==null?void 0:L.states)==null?void 0:U.active,He=(J=(D=Q[$e])==null?void 0:D.states)==null?void 0:J.active;return c===oe&&Ae||Le?"left":c===0&&Me||He?"right":!1}function q(){I.value=!0,s.pauseOnHover&&i()}function w(){I.value=!1,m()}function g(t){e(N)||n.value.forEach((c,L)=>{t===A(c,L)&&(c.states.hover=!0)})}function k(){e(N)||n.value.forEach(t=>{t.states.hover=!1})}function R(t){a.value=t}function te(t){s.trigger==="hover"&&t!==a.value&&(a.value=t)}function be(){h(a.value-1)}function Se(){h(a.value+1)}function se(){i(),s.pauseOnHover||m()}function Ne(t){s.height==="auto"&&(C.value=t)}function Ee(){var t;const c=(t=f.default)==null?void 0:t.call(f);if(!c)return null;const L=fe(c),U="ElCarouselItem",D=L.filter(J=>de(J)&&J.type.name===U);return(D==null?void 0:D.length)===2&&s.loop&&!O.value?(S.value=!0,D):(S.value=!1,null)}X(()=>a.value,(t,c)=>{u(c),S.value&&(t=t%2,c=c%2),c>-1&&_("change",t,c)}),X(()=>s.autoplay,t=>{t?m():i()}),X(()=>s.loop,()=>{h(a.value)}),X(()=>s.interval,()=>{se()});const ae=ce();return me(()=>{X(()=>n.value,()=>{n.value.length>0&&h(s.initialIndex)},{immediate:!0}),ae.value=De(v.value,()=>{u()}),m()}),Re(()=>{i(),v.value&&ae.value&&ae.value.stop()}),Ue(we,{root:v,isCardType:O,isVertical:N,items:n,loop:s.loop,addItem:p,removeItem:l,setActiveItem:h,setContainerHeight:Ne}),{root:v,activeIndex:a,arrowDisplay:$,hasLabel:T,hover:I,isCardType:O,items:n,isVertical:N,containerStyle:M,isItemsTwoLength:S,handleButtonEnter:g,handleButtonLeave:k,handleIndicatorClick:R,handleMouseEnter:q,handleMouseLeave:w,setActiveItem:h,prev:be,next:Se,PlaceholderItem:Ee,isTwoLengthShow:r,throttledArrowClick:P,throttledIndicatorHover:K}},lt=["onMouseenter","onClick"],rt={key:0},it="ElCarousel",ut=Z({name:it}),ct=Z({...ut,props:st,emits:nt,setup(s,{expose:_,emit:o}){const n=s,{root:p,activeIndex:l,arrowDisplay:f,hasLabel:a,hover:d,isCardType:I,items:v,isVertical:C,containerStyle:S,handleButtonEnter:$,handleButtonLeave:T,handleIndicatorClick:O,handleMouseEnter:N,handleMouseLeave:M,setActiveItem:P,prev:K,next:r,PlaceholderItem:i,isTwoLengthShow:m,throttledArrowClick:y,throttledIndicatorHover:h}=ot(n,o),u=pe("carousel"),A=H(()=>{const w=[u.b(),u.m(n.direction)];return e(I)&&w.push(u.m("card")),w}),q=H(()=>{const w=[u.e("indicators"),u.em("indicators",n.direction)];return e(a)&&w.push(u.em("indicators","labels")),n.indicatorPosition==="outside"&&w.push(u.em("indicators","outside")),e(C)&&w.push(u.em("indicators","right")),w});return _({setActiveItem:P,prev:K,next:r}),(w,g)=>(E(),z("div",{ref_key:"root",ref:p,class:V(e(A)),onMouseenter:g[6]||(g[6]=Y((...k)=>e(N)&&e(N)(...k),["stop"])),onMouseleave:g[7]||(g[7]=Y((...k)=>e(M)&&e(M)(...k),["stop"]))},[W("div",{class:V(e(u).e("container")),style:_e(e(S))},[e(f)?(E(),ee(re,{key:0,name:"carousel-arrow-left",persisted:""},{default:j(()=>[x(W("button",{type:"button",class:V([e(u).e("arrow"),e(u).em("arrow","left")]),onMouseenter:g[0]||(g[0]=k=>e($)("left")),onMouseleave:g[1]||(g[1]=(...k)=>e(T)&&e(T)(...k)),onClick:g[2]||(g[2]=Y(k=>e(y)(e(l)-1),["stop"]))},[B(e(le),null,{default:j(()=>[B(e(je))]),_:1})],34),[[G,(w.arrow==="always"||e(d))&&(n.loop||e(l)>0)]])]),_:1})):F("v-if",!0),e(f)?(E(),ee(re,{key:1,name:"carousel-arrow-right",persisted:""},{default:j(()=>[x(W("button",{type:"button",class:V([e(u).e("arrow"),e(u).em("arrow","right")]),onMouseenter:g[3]||(g[3]=k=>e($)("right")),onMouseleave:g[4]||(g[4]=(...k)=>e(T)&&e(T)(...k)),onClick:g[5]||(g[5]=Y(k=>e(y)(e(l)+1),["stop"]))},[B(e(le),null,{default:j(()=>[B(e(Ke))]),_:1})],34),[[G,(w.arrow==="always"||e(d))&&(n.loop||e(l)<e(v).length-1)]])]),_:1})):F("v-if",!0),B(e(i)),ge(w.$slots,"default")],6),w.indicatorPosition!=="none"?(E(),z("ul",{key:0,class:V(e(q))},[(E(!0),z(ye,null,Ie(e(v),(k,R)=>x((E(),z("li",{key:R,class:V([e(u).e("indicator"),e(u).em("indicator",w.direction),e(u).is("active",R===e(l))]),onMouseenter:te=>e(h)(R),onClick:Y(te=>e(O)(R),["stop"])},[W("button",{class:V(e(u).e("button"))},[e(a)?(E(),z("span",rt,Fe(k.props.label),1)):F("v-if",!0)],2)],42,lt)),[[G,e(m)(R)]])),128))],2)):F("v-if",!0)],34))}});var ft=Ce(ct,[["__file","carousel.vue"]]);const dt=ve({name:{type:String,default:""},label:{type:[String,Number],default:""}}),vt=(s,_)=>{const o=qe(we),n=he(),p=.83,l=b(),f=b(!1),a=b(0),d=b(1),I=b(!1),v=b(!1),C=b(!1),S=b(!1),{isCardType:$,isVertical:T}=o;function O(r,i,m){const y=m-1,h=i-1,u=i+1,A=m/2;return i===0&&r===y?-1:i===y&&r===0?m:r<h&&i-r>=A?m+1:r>u&&r-i>=A?-2:r}function N(r,i){var m,y;const h=e(T)?((m=o.root.value)==null?void 0:m.offsetHeight)||0:((y=o.root.value)==null?void 0:y.offsetWidth)||0;return C.value?h*((2-p)*(r-i)+1)/4:r<i?-(1+p)*h/4:(3+p)*h/4}function M(r,i,m){const y=o.root.value;return y?((m?y.offsetHeight:y.offsetWidth)||0)*(r-i):0}const P=(r,i,m)=>{var y;const h=e($),u=(y=o.items.value.length)!=null?y:Number.NaN,A=r===i;!h&&!Xe(m)&&(S.value=A||r===m),!A&&u>2&&o.loop&&(r=O(r,i,u));const q=e(T);I.value=A,h?(C.value=Math.round(Math.abs(r-i))<=1,a.value=N(r,i),d.value=e(I)?1:p):a.value=M(r,i,q),v.value=!0,A&&l.value&&o.setContainerHeight(l.value.offsetHeight)};function K(){if(o&&e($)){const r=o.items.value.findIndex(({uid:i})=>i===n.uid);o.setActiveItem(r)}}return me(()=>{o.addItem({props:s,states:Je({hover:f,translate:a,scale:d,active:I,ready:v,inStage:C,animating:S}),uid:n.uid,translateItem:P})}),Qe(()=>{o.removeItem(n.uid)}),{carouselItemRef:l,active:I,animating:S,hover:f,inStage:C,isVertical:T,translate:a,isCardType:$,scale:d,ready:v,handleItemClick:K}},mt=Z({name:"ElCarouselItem"}),ht=Z({...mt,props:dt,setup(s){const _=s,o=pe("carousel"),{carouselItemRef:n,active:p,animating:l,hover:f,inStage:a,isVertical:d,translate:I,isCardType:v,scale:C,ready:S,handleItemClick:$}=vt(_),T=H(()=>[o.e("item"),o.is("active",p.value),o.is("in-stage",a.value),o.is("hover",f.value),o.is("animating",l.value),{[o.em("item","card")]:v.value,[o.em("item","card-vertical")]:v.value&&d.value}]),O=H(()=>{const M=`${`translate${e(d)?"Y":"X"}`}(${e(I)}px)`,P=`scale(${e(C)})`;return{transform:[M,P].join(" ")}});return(N,M)=>x((E(),z("div",{ref_key:"carouselItemRef",ref:n,class:V(e(T)),style:_e(e(O)),onClick:M[0]||(M[0]=(...P)=>e($)&&e($)(...P))},[e(v)?x((E(),z("div",{key:0,class:V(e(o).e("mask"))},null,2)),[[G,!e(p)]]):F("v-if",!0),ge(N.$slots,"default")],6)),[[G,e(S)]])}});var ke=Ce(ht,[["__file","carousel-item.vue"]]);const pt=Ye(ft,{CarouselItem:ke}),gt=xe(ke);function _t(){return $request.get({url:"/pc/index"})}const yt={class:"index"},It={class:"flex"},Ct={class:"w-[750px] h-[340px] flex-none mr-5"},wt={class:"mt-5 flex"},Mt=Z({__name:"index",async setup(s){let _,o;const n=Ge(),{data:p}=([_,o]=Ze(()=>Pe(()=>_t(),{default:()=>({all:[],hot:[],new:[],page:{}})},"$pqtWcjQkdb")),_=await _,o(),_),l=H(()=>{var a;try{const d=JSON.parse(p.value.page.data);return console.log(d),(a=d.find(I=>I.name==="pc-banner"))==null?void 0:a.content}catch{return{}}}),f=H(()=>{var a;return((a=l.value)==null?void 0:a.data)||[]});return(a,d)=>{const I=Be,v=Oe;return E(),z("div",yt,[W("div",It,[W("div",Ct,[e(l).enabled?(E(),ee(e(pt),{key:0,class:"w-full",trigger:"click",height:"340px"},{default:j(()=>[(E(!0),z(ye,null,Ie(e(f),C=>(E(),ee(e(gt),{key:C},{default:j(()=>[B(I,{to:C.link.path,target:"_blank"},{default:j(()=>[B(e(et),{class:"w-full h-full rounded-[8px] bg-white overflow-hidden",src:e(n).getImageUrl(C.image),fit:"contain"},null,8,["src"])]),_:2},1032,["to"])]),_:2},1024))),128))]),_:1})):F("",!0)]),B(v,{link:"/information/new",class:"flex-1 min-w-0",header:"最新资讯",data:e(p).new,"show-time":!1},null,8,["data"])]),W("div",wt,[B(v,{link:"/information",class:"w-[750px] flex-none mr-5",header:"全部资讯",data:e(p).all,"only-title":!1},null,8,["data"]),B(v,{link:"/information/hot",class:"flex-1",header:"热门资讯",data:e(p).hot,"only-title":!1,"image-size":"mini","show-author":!1,"show-desc":!1,"show-click":!1,border:!1,"title-line":2},null,8,["data"])])])}}});export{Mt as default};
