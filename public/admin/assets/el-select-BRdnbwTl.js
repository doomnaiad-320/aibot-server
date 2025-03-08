import{a9 as he,c as u,aB as z,ah as J,ai as il,bH as U,V as G,ae as Te,c1 as _l,ar as ge,d as se,an as ne,aJ as ul,e as we,j as ae,ax as ke,aG as xl,H as q,B as te,R as $e,o as v,a as V,U as $,b as k,t as L,Y as d,ao as B,i as I,k as Re,aI as H,G as T,as as be,bb as et,c2 as lt,c3 as tt,ac as nt,ak as at,c4 as st,af as F,c5 as ot,aj as it,aa as ve,c6 as el,ad as ut,bD as rt,a7 as dt,T as ct,aD as le,c7 as Ve,bI as pt,c8 as ft,a5 as Q,c9 as vt,b6 as rl,a6 as mt,at as bt,a3 as ht,au as me,ca as gt,bp as ll,cb as yt,bK as St,cc as Ct,cd as Ot,a4 as wt,bJ as Vt,bF as It,S as Et,bM as Tt,av as dl,O as K,z as kt,m as A,w as M,F as tl,r as nl,p as al,C as W,n as ee,ce as $t,aq as Ie,cf as Rt,cg as Mt,ay as Dt,az as cl}from"./index-B2xNDy79.js";import{t as sl,E as Bt}from"./index-CcX0CyWL.js";import{s as ye,a as pl}from"./token-DI9FKtlJ.js";import{i as Ee}from"./isEqual-CLGO95LP.js";import{b as Lt}from"./el-tag-CuODyGk4.js";function Nt(e,o,a,h){e.length;for(var s=a+1;s--;)if(o(e[s],s,e))return s;return-1}function Wt(e,o,a){var h=e==null?0:e.length;if(!h)return-1;var s=h-1;return Nt(e,Lt(o),s)}function zt(e,o){const a=he(ye),h=he(pl,{disabled:!1}),s=u(()=>g(z(a.props.modelValue),e.value)),S=u(()=>{var c;if(a.props.multiple){const f=z((c=a.props.modelValue)!=null?c:[]);return!s.value&&f.length>=a.props.multipleLimit&&a.props.multipleLimit>0}else return!1}),t=u(()=>e.label||(J(e.value)?"":e.value)),m=u(()=>e.value||e.label||""),p=u(()=>e.disabled||o.groupDisabled||S.value),y=Te(),g=(c=[],f)=>{if(J(e.value)){const r=a.props.valueKey;return c&&c.some(E=>il(U(E,r))===U(f,r))}else return c&&c.includes(f)},C=()=>{!e.disabled&&!h.disabled&&(a.states.hoveringIndex=a.optionsArray.indexOf(y.proxy))},O=c=>{const f=new RegExp(_l(c),"i");o.visible=f.test(t.value)||e.created};return G(()=>t.value,()=>{!e.created&&!a.props.remote&&a.setSelected()}),G(()=>e.value,(c,f)=>{const{remote:r,valueKey:E}=a.props;if(c!==f&&(a.onOptionDestroy(f,y.proxy),a.onOptionCreate(y.proxy)),!e.created&&!r){if(E&&J(c)&&J(f)&&c[E]===f[E])return;a.setSelected()}}),G(()=>h.disabled,()=>{o.groupDisabled=h.disabled},{immediate:!0}),{select:a,currentLabel:t,currentValue:m,itemSelected:s,isDisabled:p,hoverItem:C,updateOption:O}}const Ft=se({name:"ElOption",componentName:"ElOption",props:{value:{required:!0,type:[String,Number,Boolean,Object]},label:[String,Number],created:Boolean,disabled:Boolean},setup(e){const o=ne("select"),a=ul(),h=u(()=>[o.be("dropdown","item"),o.is("disabled",we(m)),o.is("selected",we(t)),o.is("hovering",we(O))]),s=ae({index:-1,groupDisabled:!1,visible:!0,hover:!1}),{currentLabel:S,itemSelected:t,isDisabled:m,select:p,hoverItem:y,updateOption:g}=zt(e,s),{visible:C,hover:O}=ke(s),c=Te().proxy;p.onOptionCreate(c),xl(()=>{const r=c.value,{selected:E}=p.states,oe=(p.props.multiple?E:[E]).some(ie=>ie.value===c.value);q(()=>{p.states.cachedOptions.get(r)===c&&!oe&&p.states.cachedOptions.delete(r)}),p.onOptionDestroy(r,c)});function f(){m.value||p.handleOptionSelect(c)}return{ns:o,id:a,containerKls:h,currentLabel:S,itemSelected:t,isDisabled:m,select:p,hoverItem:y,updateOption:g,visible:C,hover:O,selectOptionClick:f,states:s}}});function Pt(e,o,a,h,s,S){return te((v(),V("li",{id:e.id,class:d(e.containerKls),role:"option","aria-disabled":e.isDisabled||void 0,"aria-selected":e.itemSelected,onMouseenter:e.hoverItem,onClick:B(e.selectOptionClick,["stop"])},[$(e.$slots,"default",{},()=>[k("span",null,L(e.currentLabel),1)])],42,["id","aria-disabled","aria-selected","onMouseenter","onClick"])),[[$e,e.visible]])}var Me=ge(Ft,[["render",Pt],["__file","option.vue"]]);const Kt=se({name:"ElSelectDropdown",componentName:"ElSelectDropdown",setup(){const e=he(ye),o=ne("select"),a=u(()=>e.props.popperClass),h=u(()=>e.props.multiple),s=u(()=>e.props.fitInputWidth),S=I("");function t(){var m;S.value=`${(m=e.selectRef)==null?void 0:m.offsetWidth}px`}return Re(()=>{t(),H(e.selectRef,t)}),{ns:o,minWidth:S,popperClass:a,isMultiple:h,isFitInputWidth:s}}});function At(e,o,a,h,s,S){return v(),V("div",{class:d([e.ns.b("dropdown"),e.ns.is("multiple",e.isMultiple),e.popperClass]),style:be({[e.isFitInputWidth?"width":"minWidth"]:e.minWidth})},[e.$slots.header?(v(),V("div",{key:0,class:d(e.ns.be("dropdown","header"))},[$(e.$slots,"header")],2)):T("v-if",!0),$(e.$slots,"default"),e.$slots.footer?(v(),V("div",{key:1,class:d(e.ns.be("dropdown","footer"))},[$(e.$slots,"footer")],2)):T("v-if",!0)],6)}var Ht=ge(Kt,[["render",At],["__file","select-dropdown.vue"]]);const Ut=11,Gt=(e,o)=>{const{t:a}=et(),h=ul(),s=ne("select"),S=ne("input"),t=ae({inputValue:"",options:new Map,cachedOptions:new Map,disabledOptions:new Map,optionValues:[],selected:[],selectionWidth:0,calculatorWidth:0,collapseItemWidth:0,selectedLabel:"",hoveringIndex:-1,previousQuery:null,inputHovering:!1,menuVisibleOnFocus:!1,isBeforeHide:!1}),m=I(null),p=I(null),y=I(null),g=I(null),C=I(null),O=I(null),c=I(null),f=I(null),r=I(null),E=I(null),Y=I(null),oe=I(null),{isComposing:ie,handleCompositionStart:vl,handleCompositionUpdate:ml,handleCompositionEnd:bl}=lt({afterComposition:l=>je(l)}),{wrapperRef:De,isFocused:Be}=tt(C,{beforeFocus(){return _.value},afterFocus(){e.automaticDropdown&&!w.value&&(w.value=!0,t.menuVisibleOnFocus=!0)},beforeBlur(l){var n,i;return((n=y.value)==null?void 0:n.isFocusInsideContent(l))||((i=g.value)==null?void 0:i.isFocusInsideContent(l))},afterBlur(){w.value=!1,t.menuVisibleOnFocus=!1}}),w=I(!1),X=I(),{form:Le,formItem:Z}=nt(),{inputId:hl}=at(e,{formItemContext:Z}),{valueOnClear:gl,isEmptyValue:yl}=st(e),_=u(()=>e.disabled||(Le==null?void 0:Le.disabled)),Se=u(()=>F(e.modelValue)?e.modelValue.length>0:!yl(e.modelValue)),Sl=u(()=>e.clearable&&!_.value&&t.inputHovering&&Se.value),Ne=u(()=>e.remote&&e.filterable&&!e.remoteShowSuffix?"":e.suffixIcon),Cl=u(()=>s.is("reverse",Ne.value&&w.value)),We=u(()=>(Z==null?void 0:Z.validateState)||""),Ol=u(()=>ot[We.value]),wl=u(()=>e.remote?300:0),ze=u(()=>e.loading?e.loadingText||a("el.select.loading"):e.remote&&!t.inputValue&&t.options.size===0?!1:e.filterable&&t.inputValue&&t.options.size>0&&ue.value===0?e.noMatchText||a("el.select.noMatch"):t.options.size===0?e.noDataText||a("el.select.noData"):null),ue=u(()=>R.value.filter(l=>l.visible).length),R=u(()=>{const l=Array.from(t.options.values()),n=[];return t.optionValues.forEach(i=>{const b=l.findIndex(N=>N.value===i);b>-1&&n.push(l[b])}),n.length>=l.length?n:l}),Vl=u(()=>Array.from(t.cachedOptions.values())),Il=u(()=>{const l=R.value.filter(n=>!n.created).some(n=>n.currentLabel===t.inputValue);return e.filterable&&e.allowCreate&&t.inputValue!==""&&!l}),Fe=()=>{e.filterable&&le(e.filterMethod)||e.filterable&&e.remote&&le(e.remoteMethod)||R.value.forEach(l=>{var n;(n=l.updateOption)==null||n.call(l,t.inputValue)})},Pe=it(),El=u(()=>["small"].includes(Pe.value)?"small":"default"),Tl=u({get(){return w.value&&ze.value!==!1},set(l){w.value=l}}),kl=u(()=>{if(e.multiple&&!ve(e.modelValue))return z(e.modelValue).length===0&&!t.inputValue;const l=F(e.modelValue)?e.modelValue[0]:e.modelValue;return e.filterable||ve(l)?!t.inputValue:!0}),$l=u(()=>{var l;const n=(l=e.placeholder)!=null?l:a("el.select.placeholder");return e.multiple||!Se.value?n:t.selectedLabel}),Rl=u(()=>el?null:"mouseenter");G(()=>e.modelValue,(l,n)=>{e.multiple&&e.filterable&&!e.reserveKeyword&&(t.inputValue="",re("")),de(),!Ee(l,n)&&e.validateEvent&&(Z==null||Z.validate("change").catch(i=>ut()))},{flush:"post",deep:!0}),G(()=>w.value,l=>{l?re(t.inputValue):(t.inputValue="",t.previousQuery=null,t.isBeforeHide=!0),o("visible-change",l)}),G(()=>t.options.entries(),()=>{var l;if(!rt)return;const n=((l=m.value)==null?void 0:l.querySelectorAll("input"))||[];(!e.filterable&&!e.defaultFirstOption&&!ve(e.modelValue)||!Array.from(n).includes(document.activeElement))&&de(),e.defaultFirstOption&&(e.filterable||e.remote)&&ue.value&&Ke()},{flush:"post"}),G(()=>t.hoveringIndex,l=>{dt(l)&&l>-1?X.value=R.value[l]||{}:X.value={},R.value.forEach(n=>{n.hover=X.value===n})}),ct(()=>{t.isBeforeHide||Fe()});const re=l=>{t.previousQuery===l||ie.value||(t.previousQuery=l,e.filterable&&le(e.filterMethod)?e.filterMethod(l):e.filterable&&e.remote&&le(e.remoteMethod)&&e.remoteMethod(l),e.defaultFirstOption&&(e.filterable||e.remote)&&ue.value?q(Ke):q(Ml))},Ke=()=>{const l=R.value.filter(b=>b.visible&&!b.disabled&&!b.states.groupDisabled),n=l.find(b=>b.created),i=l[0];t.hoveringIndex=Ye(R.value,n||i)},de=()=>{if(e.multiple)t.selectedLabel="";else{const n=F(e.modelValue)?e.modelValue[0]:e.modelValue,i=Ae(n);t.selectedLabel=i.currentLabel,t.selected=[i];return}const l=[];ve(e.modelValue)||z(e.modelValue).forEach(n=>{l.push(Ae(n))}),t.selected=l},Ae=l=>{let n;const i=Ve(l).toLowerCase()==="object",b=Ve(l).toLowerCase()==="null",N=Ve(l).toLowerCase()==="undefined";for(let P=t.cachedOptions.size-1;P>=0;P--){const D=Vl.value[P];if(i?U(D.value,e.valueKey)===U(l,e.valueKey):D.value===l){n={value:l,currentLabel:D.currentLabel,get isDisabled(){return D.isDisabled}};break}}if(n)return n;const j=i?l.label:!b&&!N?l:"";return{value:l,currentLabel:j}},Ml=()=>{t.hoveringIndex=R.value.findIndex(l=>t.selected.some(n=>Oe(n)===Oe(l)))},Dl=()=>{t.selectionWidth=p.value.getBoundingClientRect().width},He=()=>{t.calculatorWidth=O.value.getBoundingClientRect().width},Bl=()=>{t.collapseItemWidth=Y.value.getBoundingClientRect().width},Ce=()=>{var l,n;(n=(l=y.value)==null?void 0:l.updatePopper)==null||n.call(l)},Ue=()=>{var l,n;(n=(l=g.value)==null?void 0:l.updatePopper)==null||n.call(l)},Ge=()=>{t.inputValue.length>0&&!w.value&&(w.value=!0),re(t.inputValue)},je=l=>{if(t.inputValue=l.target.value,e.remote)qe();else return Ge()},qe=pt(()=>{Ge()},wl.value),x=l=>{Ee(e.modelValue,l)||o(rl,l)},Ll=l=>Wt(l,n=>!t.disabledOptions.has(n)),Nl=l=>{if(e.multiple&&l.code!==ft.delete&&l.target.value.length<=0){const n=z(e.modelValue).slice(),i=Ll(n);if(i<0)return;const b=n[i];n.splice(i,1),o(Q,n),x(n),o("remove-tag",b)}},Wl=(l,n)=>{const i=t.selected.indexOf(n);if(i>-1&&!_.value){const b=z(e.modelValue).slice();b.splice(i,1),o(Q,b),x(b),o("remove-tag",n.value)}l.stopPropagation(),pe()},Qe=l=>{l.stopPropagation();const n=e.multiple?[]:gl.value;if(e.multiple)for(const i of t.selected)i.isDisabled&&n.push(i.value);o(Q,n),x(n),t.hoveringIndex=-1,w.value=!1,o("clear"),pe()},Je=l=>{var n;if(e.multiple){const i=z((n=e.modelValue)!=null?n:[]).slice(),b=Ye(i,l.value);b>-1?i.splice(b,1):(e.multipleLimit<=0||i.length<e.multipleLimit)&&i.push(l.value),o(Q,i),x(i),l.created&&re(""),e.filterable&&!e.reserveKeyword&&(t.inputValue="")}else o(Q,l.value),x(l.value),w.value=!1;pe(),!w.value&&q(()=>{ce(l)})},Ye=(l=[],n)=>{if(!J(n))return l.indexOf(n);const i=e.valueKey;let b=-1;return l.some((N,j)=>il(U(N,i))===U(n,i)?(b=j,!0):!1),b},ce=l=>{var n,i,b,N,j;const fe=F(l)?l[0]:l;let P=null;if(fe!=null&&fe.value){const D=R.value.filter(xe=>xe.value===fe.value);D.length>0&&(P=D[0].$el)}if(y.value&&P){const D=(N=(b=(i=(n=y.value)==null?void 0:n.popperRef)==null?void 0:i.contentRef)==null?void 0:b.querySelector)==null?void 0:N.call(b,`.${s.be("dropdown","wrap")}`);D&&vt(D,P)}(j=oe.value)==null||j.handleScroll()},zl=l=>{t.options.set(l.value,l),t.cachedOptions.set(l.value,l),l.disabled&&t.disabledOptions.set(l.value,l)},Fl=(l,n)=>{t.options.get(l)===n&&t.options.delete(l)},Pl=u(()=>{var l,n;return(n=(l=y.value)==null?void 0:l.popperRef)==null?void 0:n.contentRef}),Kl=()=>{t.isBeforeHide=!1,q(()=>ce(t.selected))},pe=()=>{var l;(l=C.value)==null||l.focus()},Xe=()=>{var l;(l=C.value)==null||l.blur()},Al=l=>{Qe(l)},Hl=()=>{w.value=!1,Be.value&&Xe()},Ul=()=>{t.inputValue.length>0?t.inputValue="":w.value=!1},Ze=()=>{_.value||(el&&(t.inputHovering=!0),t.menuVisibleOnFocus?t.menuVisibleOnFocus=!1:w.value=!w.value)},Gl=()=>{w.value?R.value[t.hoveringIndex]&&Je(R.value[t.hoveringIndex]):Ze()},Oe=l=>J(l.value)?U(l.value,e.valueKey):l.value,jl=u(()=>R.value.filter(l=>l.visible).every(l=>l.disabled)),ql=u(()=>e.multiple?e.collapseTags?t.selected.slice(0,e.maxCollapseTags):t.selected:[]),Ql=u(()=>e.multiple?e.collapseTags?t.selected.slice(e.maxCollapseTags):[]:[]),_e=l=>{if(!w.value){w.value=!0;return}if(!(t.options.size===0||t.filteredOptionsCount===0||ie.value)&&!jl.value){l==="next"?(t.hoveringIndex++,t.hoveringIndex===t.options.size&&(t.hoveringIndex=0)):l==="prev"&&(t.hoveringIndex--,t.hoveringIndex<0&&(t.hoveringIndex=t.options.size-1));const n=R.value[t.hoveringIndex];(n.disabled===!0||n.states.groupDisabled===!0||!n.visible)&&_e(l),q(()=>ce(X.value))}},Jl=()=>{if(!p.value)return 0;const l=window.getComputedStyle(p.value);return Number.parseFloat(l.gap||"6px")},Yl=u(()=>{const l=Jl();return{maxWidth:`${Y.value&&e.maxCollapseTags===1?t.selectionWidth-t.collapseItemWidth-l:t.selectionWidth}px`}}),Xl=u(()=>({maxWidth:`${t.selectionWidth}px`})),Zl=u(()=>({width:`${Math.max(t.calculatorWidth,Ut)}px`}));return H(p,Dl),H(O,He),H(r,Ce),H(De,Ce),H(E,Ue),H(Y,Bl),Re(()=>{de()}),{inputId:hl,contentId:h,nsSelect:s,nsInput:S,states:t,isFocused:Be,expanded:w,optionsArray:R,hoverOption:X,selectSize:Pe,filteredOptionsCount:ue,resetCalculatorWidth:He,updateTooltip:Ce,updateTagTooltip:Ue,debouncedOnInputChange:qe,onInput:je,deletePrevTag:Nl,deleteTag:Wl,deleteSelected:Qe,handleOptionSelect:Je,scrollToOption:ce,hasModelValue:Se,shouldShowPlaceholder:kl,currentPlaceholder:$l,mouseEnterEventName:Rl,showClose:Sl,iconComponent:Ne,iconReverse:Cl,validateState:We,validateIcon:Ol,showNewOption:Il,updateOptions:Fe,collapseTagSize:El,setSelected:de,selectDisabled:_,emptyText:ze,handleCompositionStart:vl,handleCompositionUpdate:ml,handleCompositionEnd:bl,onOptionCreate:zl,onOptionDestroy:Fl,handleMenuEnter:Kl,focus:pe,blur:Xe,handleClearClick:Al,handleClickOutside:Hl,handleEsc:Ul,toggleMenu:Ze,selectOption:Gl,getValueKey:Oe,navigateOptions:_e,dropdownMenuVisible:Tl,showTagList:ql,collapseTagList:Ql,tagStyle:Yl,collapseTagStyle:Xl,inputStyle:Zl,popperRef:Pl,inputRef:C,tooltipRef:y,tagTooltipRef:g,calculatorRef:O,prefixRef:c,suffixRef:f,selectRef:m,wrapperRef:De,selectionRef:p,scrollbarRef:oe,menuRef:r,tagMenuRef:E,collapseItemRef:Y}};var jt=se({name:"ElOptions",setup(e,{slots:o}){const a=he(ye);let h=[];return()=>{var s,S;const t=(s=o.default)==null?void 0:s.call(o),m=[];function p(y){F(y)&&y.forEach(g=>{var C,O,c,f;const r=(C=(g==null?void 0:g.type)||{})==null?void 0:C.name;r==="ElOptionGroup"?p(!mt(g.children)&&!F(g.children)&&le((O=g.children)==null?void 0:O.default)?(c=g.children)==null?void 0:c.default():g.children):r==="ElOption"?m.push((f=g.props)==null?void 0:f.value):F(g.children)&&p(g.children)})}return t.length&&p((S=t[0])==null?void 0:S.children),Ee(m,h)||(h=m,a&&(a.states.optionValues=m)),t}}});const qt=bt({name:String,id:String,modelValue:{type:[Array,String,Number,Boolean,Object],default:void 0},autocomplete:{type:String,default:"off"},automaticDropdown:Boolean,size:ht,effect:{type:me(String),default:"light"},disabled:Boolean,clearable:Boolean,filterable:Boolean,allowCreate:Boolean,loading:Boolean,popperClass:{type:String,default:""},popperOptions:{type:me(Object),default:()=>({})},remote:Boolean,loadingText:String,noMatchText:String,noDataText:String,remoteMethod:Function,filterMethod:Function,multiple:Boolean,multipleLimit:{type:Number,default:0},placeholder:{type:String},defaultFirstOption:Boolean,reserveKeyword:{type:Boolean,default:!0},valueKey:{type:String,default:"value"},collapseTags:Boolean,collapseTagsTooltip:Boolean,maxCollapseTags:{type:Number,default:1},teleported:gt.teleported,persistent:{type:Boolean,default:!0},clearIcon:{type:ll,default:yt},fitInputWidth:Boolean,suffixIcon:{type:ll,default:St},tagType:{...sl.type,default:"info"},tagEffect:{...sl.effect,default:"light"},validateEvent:{type:Boolean,default:!0},remoteShowSuffix:Boolean,placement:{type:me(String),values:Ct,default:"bottom-start"},fallbackPlacements:{type:me(Array),default:["bottom-start","top-start","right","left"]},...Ot,...wt(["ariaLabel"])}),ol="ElSelect",Qt=se({name:ol,componentName:ol,components:{ElSelectMenu:Ht,ElOption:Me,ElOptions:jt,ElTag:Bt,ElScrollbar:Vt,ElTooltip:It,ElIcon:Et},directives:{ClickOutside:Tt},props:qt,emits:[Q,rl,"remove-tag","clear","visible-change","focus","blur"],setup(e,{emit:o}){const a=u(()=>{const{modelValue:S,multiple:t}=e,m=t?[]:void 0;return F(S)?t?S:m:t?m:S}),h=ae({...ke(e),modelValue:a}),s=Gt(h,o);return dl(ye,ae({props:h,states:s.states,optionsArray:s.optionsArray,handleOptionSelect:s.handleOptionSelect,onOptionCreate:s.onOptionCreate,onOptionDestroy:s.onOptionDestroy,selectRef:s.selectRef,setSelected:s.setSelected})),{...s,modelValue:a}}});function Jt(e,o,a,h,s,S){const t=K("el-tag"),m=K("el-tooltip"),p=K("el-icon"),y=K("el-option"),g=K("el-options"),C=K("el-scrollbar"),O=K("el-select-menu"),c=kt("click-outside");return te((v(),V("div",{ref:"selectRef",class:d([e.nsSelect.b(),e.nsSelect.m(e.selectSize)]),[Rt(e.mouseEnterEventName)]:f=>e.states.inputHovering=!0,onMouseleave:f=>e.states.inputHovering=!1},[A(m,{ref:"tooltipRef",visible:e.dropdownMenuVisible,placement:e.placement,teleported:e.teleported,"popper-class":[e.nsSelect.e("popper"),e.popperClass],"popper-options":e.popperOptions,"fallback-placements":e.fallbackPlacements,effect:e.effect,pure:"",trigger:"click",transition:`${e.nsSelect.namespace.value}-zoom-in-top`,"stop-popper-mouse-event":!1,"gpu-acceleration":!1,persistent:e.persistent,onBeforeShow:e.handleMenuEnter,onHide:f=>e.states.isBeforeHide=!1},{default:M(()=>{var f;return[k("div",{ref:"wrapperRef",class:d([e.nsSelect.e("wrapper"),e.nsSelect.is("focused",e.isFocused),e.nsSelect.is("hovering",e.states.inputHovering),e.nsSelect.is("filterable",e.filterable),e.nsSelect.is("disabled",e.selectDisabled)]),onClick:B(e.toggleMenu,["prevent"])},[e.$slots.prefix?(v(),V("div",{key:0,ref:"prefixRef",class:d(e.nsSelect.e("prefix"))},[$(e.$slots,"prefix")],2)):T("v-if",!0),k("div",{ref:"selectionRef",class:d([e.nsSelect.e("selection"),e.nsSelect.is("near",e.multiple&&!e.$slots.prefix&&!!e.states.selected.length)])},[e.multiple?$(e.$slots,"tag",{key:0},()=>[(v(!0),V(tl,null,nl(e.showTagList,r=>(v(),V("div",{key:e.getValueKey(r),class:d(e.nsSelect.e("selected-item"))},[A(t,{closable:!e.selectDisabled&&!r.isDisabled,size:e.collapseTagSize,type:e.tagType,effect:e.tagEffect,"disable-transitions":"",style:be(e.tagStyle),onClose:E=>e.deleteTag(E,r)},{default:M(()=>[k("span",{class:d(e.nsSelect.e("tags-text"))},[$(e.$slots,"label",{label:r.currentLabel,value:r.value},()=>[al(L(r.currentLabel),1)])],2)]),_:2},1032,["closable","size","type","effect","style","onClose"])],2))),128)),e.collapseTags&&e.states.selected.length>e.maxCollapseTags?(v(),W(m,{key:0,ref:"tagTooltipRef",disabled:e.dropdownMenuVisible||!e.collapseTagsTooltip,"fallback-placements":["bottom","top","right","left"],effect:e.effect,placement:"bottom",teleported:e.teleported},{default:M(()=>[k("div",{ref:"collapseItemRef",class:d(e.nsSelect.e("selected-item"))},[A(t,{closable:!1,size:e.collapseTagSize,type:e.tagType,effect:e.tagEffect,"disable-transitions":"",style:be(e.collapseTagStyle)},{default:M(()=>[k("span",{class:d(e.nsSelect.e("tags-text"))}," + "+L(e.states.selected.length-e.maxCollapseTags),3)]),_:1},8,["size","type","effect","style"])],2)]),content:M(()=>[k("div",{ref:"tagMenuRef",class:d(e.nsSelect.e("selection"))},[(v(!0),V(tl,null,nl(e.collapseTagList,r=>(v(),V("div",{key:e.getValueKey(r),class:d(e.nsSelect.e("selected-item"))},[A(t,{class:"in-tooltip",closable:!e.selectDisabled&&!r.isDisabled,size:e.collapseTagSize,type:e.tagType,effect:e.tagEffect,"disable-transitions":"",onClose:E=>e.deleteTag(E,r)},{default:M(()=>[k("span",{class:d(e.nsSelect.e("tags-text"))},[$(e.$slots,"label",{label:r.currentLabel,value:r.value},()=>[al(L(r.currentLabel),1)])],2)]),_:2},1032,["closable","size","type","effect","onClose"])],2))),128))],2)]),_:3},8,["disabled","effect","teleported"])):T("v-if",!0)]):T("v-if",!0),e.selectDisabled?T("v-if",!0):(v(),V("div",{key:1,class:d([e.nsSelect.e("selected-item"),e.nsSelect.e("input-wrapper"),e.nsSelect.is("hidden",!e.filterable)])},[te(k("input",{id:e.inputId,ref:"inputRef","onUpdate:modelValue":r=>e.states.inputValue=r,type:"text",name:e.name,class:d([e.nsSelect.e("input"),e.nsSelect.is(e.selectSize)]),disabled:e.selectDisabled,autocomplete:e.autocomplete,style:be(e.inputStyle),role:"combobox",readonly:!e.filterable,spellcheck:"false","aria-activedescendant":((f=e.hoverOption)==null?void 0:f.id)||"","aria-controls":e.contentId,"aria-expanded":e.dropdownMenuVisible,"aria-label":e.ariaLabel,"aria-autocomplete":"none","aria-haspopup":"listbox",onKeydown:[ee(B(r=>e.navigateOptions("next"),["stop","prevent"]),["down"]),ee(B(r=>e.navigateOptions("prev"),["stop","prevent"]),["up"]),ee(B(e.handleEsc,["stop","prevent"]),["esc"]),ee(B(e.selectOption,["stop","prevent"]),["enter"]),ee(B(e.deletePrevTag,["stop"]),["delete"])],onCompositionstart:e.handleCompositionStart,onCompositionupdate:e.handleCompositionUpdate,onCompositionend:e.handleCompositionEnd,onInput:e.onInput,onClick:B(e.toggleMenu,["stop"])},null,46,["id","onUpdate:modelValue","name","disabled","autocomplete","readonly","aria-activedescendant","aria-controls","aria-expanded","aria-label","onKeydown","onCompositionstart","onCompositionupdate","onCompositionend","onInput","onClick"]),[[$t,e.states.inputValue]]),e.filterable?(v(),V("span",{key:0,ref:"calculatorRef","aria-hidden":"true",class:d(e.nsSelect.e("input-calculator")),textContent:L(e.states.inputValue)},null,10,["textContent"])):T("v-if",!0)],2)),e.shouldShowPlaceholder?(v(),V("div",{key:2,class:d([e.nsSelect.e("selected-item"),e.nsSelect.e("placeholder"),e.nsSelect.is("transparent",!e.hasModelValue||e.expanded&&!e.states.inputValue)])},[e.hasModelValue?$(e.$slots,"label",{key:0,label:e.currentPlaceholder,value:e.modelValue},()=>[k("span",null,L(e.currentPlaceholder),1)]):(v(),V("span",{key:1},L(e.currentPlaceholder),1))],2)):T("v-if",!0)],2),k("div",{ref:"suffixRef",class:d(e.nsSelect.e("suffix"))},[e.iconComponent&&!e.showClose?(v(),W(p,{key:0,class:d([e.nsSelect.e("caret"),e.nsSelect.e("icon"),e.iconReverse])},{default:M(()=>[(v(),W(Ie(e.iconComponent)))]),_:1},8,["class"])):T("v-if",!0),e.showClose&&e.clearIcon?(v(),W(p,{key:1,class:d([e.nsSelect.e("caret"),e.nsSelect.e("icon"),e.nsSelect.e("clear")]),onClick:e.handleClearClick},{default:M(()=>[(v(),W(Ie(e.clearIcon)))]),_:1},8,["class","onClick"])):T("v-if",!0),e.validateState&&e.validateIcon?(v(),W(p,{key:2,class:d([e.nsInput.e("icon"),e.nsInput.e("validateIcon")])},{default:M(()=>[(v(),W(Ie(e.validateIcon)))]),_:1},8,["class"])):T("v-if",!0)],2)],10,["onClick"])]}),content:M(()=>[A(O,{ref:"menuRef"},{default:M(()=>[e.$slots.header?(v(),V("div",{key:0,class:d(e.nsSelect.be("dropdown","header")),onClick:B(()=>{},["stop"])},[$(e.$slots,"header")],10,["onClick"])):T("v-if",!0),te(A(C,{id:e.contentId,ref:"scrollbarRef",tag:"ul","wrap-class":e.nsSelect.be("dropdown","wrap"),"view-class":e.nsSelect.be("dropdown","list"),class:d([e.nsSelect.is("empty",e.filteredOptionsCount===0)]),role:"listbox","aria-label":e.ariaLabel,"aria-orientation":"vertical"},{default:M(()=>[e.showNewOption?(v(),W(y,{key:0,value:e.states.inputValue,created:!0},null,8,["value"])):T("v-if",!0),A(g,null,{default:M(()=>[$(e.$slots,"default")]),_:3})]),_:3},8,["id","wrap-class","view-class","class","aria-label"]),[[$e,e.states.options.size>0&&!e.loading]]),e.$slots.loading&&e.loading?(v(),V("div",{key:1,class:d(e.nsSelect.be("dropdown","loading"))},[$(e.$slots,"loading")],2)):e.loading||e.filteredOptionsCount===0?(v(),V("div",{key:2,class:d(e.nsSelect.be("dropdown","empty"))},[$(e.$slots,"empty",{},()=>[k("span",null,L(e.emptyText),1)])],2)):T("v-if",!0),e.$slots.footer?(v(),V("div",{key:3,class:d(e.nsSelect.be("dropdown","footer")),onClick:B(()=>{},["stop"])},[$(e.$slots,"footer")],10,["onClick"])):T("v-if",!0)]),_:3},512)]),_:3},8,["visible","placement","teleported","popper-class","popper-options","fallback-placements","effect","transition","persistent","onBeforeShow","onHide"])],16,["onMouseleave"])),[[c,e.handleClickOutside,e.popperRef]])}var Yt=ge(Qt,[["render",Jt],["__file","select.vue"]]);const Xt=se({name:"ElOptionGroup",componentName:"ElOptionGroup",props:{label:String,disabled:Boolean},setup(e){const o=ne("select"),a=I(null),h=Te(),s=I([]);dl(pl,ae({...ke(e)}));const S=u(()=>s.value.some(y=>y.visible===!0)),t=y=>{var g,C;return((g=y.type)==null?void 0:g.name)==="ElOption"&&!!((C=y.component)!=null&&C.proxy)},m=y=>{const g=z(y),C=[];return g.forEach(O=>{var c,f;t(O)?C.push(O.component.proxy):(c=O.children)!=null&&c.length?C.push(...m(O.children)):(f=O.component)!=null&&f.subTree&&C.push(...m(O.component.subTree))}),C},p=()=>{s.value=m(h.subTree)};return Re(()=>{p()}),Mt(a,p,{attributes:!0,subtree:!0,childList:!0}),{groupRef:a,visible:S,ns:o}}});function Zt(e,o,a,h,s,S){return te((v(),V("ul",{ref:"groupRef",class:d(e.ns.be("group","wrap"))},[k("li",{class:d(e.ns.be("group","title"))},L(e.label),3),k("li",null,[k("ul",{class:d(e.ns.b("group"))},[$(e.$slots,"default")],2)])],2)),[[$e,e.visible]])}var fl=ge(Xt,[["render",Zt],["__file","option-group.vue"]]);const nn=Dt(Yt,{Option:Me,OptionGroup:fl}),an=cl(Me);cl(fl);export{an as E,nn as a};
