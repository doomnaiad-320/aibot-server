import{j as f,ai as p}from"./index-B2xNDy79.js";function v(t){const s=f({}),o=Object.keys(t),i=o.map(e=>{const a=t[e];return s[e]=[],()=>a.api(p(a.params)||{})}),r=async()=>{(await Promise.allSettled(i.map(a=>a()))).forEach((a,u)=>{const n=o[u];if(a.status=="fulfilled"){const{transformData:c}=t[n],l=c?c(a.value):a.value;s[n]=l}})};return r(),{optionsData:s,refresh:r}}export{v as u};
