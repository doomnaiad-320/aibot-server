import{aR as p,b4 as y,aT as O,aV as m}from"./index-B2xNDy79.js";import{e as v,f as x,h as w,o as P,U as a}from"./_Uint8Array-0jgVjd-W.js";var i=Object.create,b=function(){function e(){}return function(r){if(!p(r))return{};if(i)return i(r);e.prototype=r;var n=new e;return e.prototype=void 0,n}}();function z(e,r){var n=-1,t=e.length;for(r||(r=Array(t));++n<t;)r[n]=e[n];return r}function M(e,r,n,t){var h=!n;n||(n={});for(var u=-1,g=r.length;++u<g;){var s=r[u],o=void 0;o===void 0&&(o=e[s]),h?y(n,s,o):O(n,s,o)}return n}function A(e){var r=[];if(e!=null)for(var n in Object(e))r.push(n);return r}var T=Object.prototype,U=T.hasOwnProperty;function C(e){if(!p(e))return A(e);var r=v(e),n=[];for(var t in e)t=="constructor"&&(r||!U.call(e,t))||n.push(t);return n}function N(e){return x(e)?w(e,!0):C(e)}var I=P(Object.getPrototypeOf,Object),d=typeof exports=="object"&&exports&&!exports.nodeType&&exports,f=d&&typeof module=="object"&&module&&!module.nodeType&&module,K=f&&f.exports===d,c=K?m.Buffer:void 0,l=c?c.allocUnsafe:void 0;function R(e,r){if(r)return e.slice();var n=e.length,t=l?l(n):new e.constructor(n);return e.copy(t),t}function L(e){var r=new e.constructor(e.byteLength);return new a(r).set(new a(e)),r}function k(e,r){var n=r?L(e.buffer):e.buffer;return new e.constructor(n,e.byteOffset,e.length)}function q(e){return typeof e.constructor=="function"&&!v(e)?b(I(e)):{}}export{L as a,k as b,M as c,z as d,R as e,I as g,q as i,N as k};
