import{_ as v}from"./items.vue.6bb962a1.js";import{_ as b}from"./card.vue.d1ff70da.js";import{u as z}from"./asyncData.018825d1.js";import{d as C}from"./news.fce18aa1.js";import{f as $,g as A,o as t,c as a,a as s,Y as n,Z as l,k as u,m as B,w as d,b as f,t as k}from"./entry.edbe2177.js";import"./nuxt-link.5da8524b.js";import"./empty_news.a51f61f1.js";import"./debounce.e1664469.js";const D=""+new URL("placeholder.1ccc50b9.png",import.meta.url).href,I=s("div",{class:"text-4xl mb-5"},"资讯中心",-1),L={class:"flex flex-wrap gap-4"},V={class:"px-4 py-5"},F={class:"flex gap-2.5"},N={class:"line-clamp-2"},T={class:"line-clamp-1"},Z=$({__name:"index",async setup(E){let c,_;const{data:g}=([c,_]=A(()=>z(()=>C(),"$zJ3VKA3QFG")),c=await c,_(),c),p=i=>({topThree:i.slice(0,3),remain:i.slice(3)});return(i,w)=>{const m=v,x=b;return t(),a("div",null,[I,s("div",L,[(t(!0),a(n,null,l(u(g),o=>(t(),B(x,{style:{width:"calc(50% - 8px)"},key:o.id,header:o.name,data:o.article,link:`/information/default?cid=${o.id}&name=${o.name}`},{content:d(({data:h})=>[s("div",V,[s("div",F,[(t(!0),a(n,null,l(p(h).topThree,(e,r)=>(t(),a("div",{class:"w-[180px] bg-page rounded overflow-hidden",key:e.id},[f(m,{index:r,id:e.id,title:e.title,desc:e.desc,click:e.click,author:e.author,"create-time":e.create_time,image:e.image||u(D),"only-title":!1,border:!1,"show-author":!1,"show-desc":!1,"show-time":!1,"show-click":!1,"is-horizontal":!0},{title:d(({title:y})=>[s("span",N,k(y),1)]),_:2},1032,["index","id","title","desc","click","author","create-time","image"])]))),128))]),(t(!0),a(n,null,l(p(h).remain,e=>(t(),a("div",{key:e.id},[f(m,{id:e.id,title:e.title,desc:e.desc,click:e.click,author:e.author,"create-time":e.create_time,image:e.image,"only-title":!0,"show-time":!1},{title:d(({title:r})=>[s("span",T,k(r),1)]),_:2},1032,["id","title","desc","click","author","create-time","image"])]))),128))])]),_:2},1032,["header","data","link"]))),128))])])}}});export{Z as default};
