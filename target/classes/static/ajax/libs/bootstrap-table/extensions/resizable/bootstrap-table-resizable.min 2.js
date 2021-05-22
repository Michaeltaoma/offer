/**
  * bootstrap-table - An extended table to integration with some of the most widely used CSS frameworks. (Supports Bootstrap, Semantic UI, Bulma, Material Design, Foundation)
  *
  * @version v1.18.2
  * @homepage https://bootstrap-table.com
  * @author wenzhixin <wenzhixin2010@gmail.com> (http://wenzhixin.net.cn/)
  * @license MIT
  */

!function(t,e){"object"==typeof exports&&"undefined"!=typeof module?e(require("jquery")):"function"==typeof define&&define.amd?define(["jquery"],e):e((t="undefined"!=typeof globalThis?globalThis:t||self).jQuery)}(this,(function(t){"use strict";function e(t){return t&&"object"==typeof t&&"default"in t?t:{default:t}}var n=e(t),r="undefined"!=typeof globalThis?globalThis:"undefined"!=typeof window?window:"undefined"!=typeof global?global:"undefined"!=typeof self?self:{};function o(t,e){return t(e={exports:{}},e.exports),e.exports}var i=function(t){return t&&t.Math==Math&&t},u=i("object"==typeof globalThis&&globalThis)||i("object"==typeof window&&window)||i("object"==typeof self&&self)||i("object"==typeof r&&r)||function(){return this}()||Function("return this")(),c=function(t){try{return!!t()}catch(t){return!0}},f=!c((function(){return 7!=Object.defineProperty({},1,{get:function(){return 7}})[1]})),a={}.propertyIsEnumerable,l=Object.getOwnPropertyDescriptor,s={f:l&&!a.call({1:2},1)?function(t){var e=l(this,t);return!!e&&e.enumerable}:a},p=function(t,e){return{enumerable:!(1&t),configurable:!(2&t),writable:!(4&t),value:e}},y={}.toString,h=function(t){return y.call(t).slice(8,-1)},b="".split,d=c((function(){return!Object("z").propertyIsEnumerable(0)}))?function(t){return"String"==h(t)?b.call(t,""):Object(t)}:Object,g=function(t){if(null==t)throw TypeError("Can't call method on "+t);return t},v=function(t){return d(g(t))},w=function(t){return"object"==typeof t?null!==t:"function"==typeof t},m=function(t,e){if(!w(t))return t;var n,r;if(e&&"function"==typeof(n=t.toString)&&!w(r=n.call(t)))return r;if("function"==typeof(n=t.valueOf)&&!w(r=n.call(t)))return r;if(!e&&"function"==typeof(n=t.toString)&&!w(r=n.call(t)))return r;throw TypeError("Can't convert object to primitive value")},O={}.hasOwnProperty,j=function(t,e){return O.call(t,e)},S=u.document,P=w(S)&&w(S.createElement),T=!f&&!c((function(){return 7!=Object.defineProperty((t="div",P?S.createElement(t):{}),"a",{get:function(){return 7}}).a;var t})),E=Object.getOwnPropertyDescriptor,x={f:f?E:function(t,e){if(t=v(t),e=m(e,!0),T)try{return E(t,e)}catch(t){}if(j(t,e))return p(!s.f.call(t,e),t[e])}},_=function(t){if(!w(t))throw TypeError(String(t)+" is not an object");return t},A=Object.defineProperty,M={f:f?A:function(t,e,n){if(_(t),e=m(e,!0),_(n),T)try{return A(t,e,n)}catch(t){}if("get"in n||"set"in n)throw TypeError("Accessors not supported");return"value"in n&&(t[e]=n.value),t}},k=f?function(t,e,n){return M.f(t,e,p(1,n))}:function(t,e,n){return t[e]=n,t},z=function(t,e){try{k(u,t,e)}catch(n){u[t]=e}return e},R="__core-js_shared__",C=u[R]||z(R,{}),V=Function.toString;"function"!=typeof C.inspectSource&&(C.inspectSource=function(t){return V.call(t)});var D,I,B,F,L=C.inspectSource,N=u.WeakMap,$="function"==typeof N&&/native code/.test(L(N)),q=o((function(t){(t.exports=function(t,e){return C[t]||(C[t]=void 0!==e?e:{})})("versions",[]).push({version:"3.8.1",mode:"global",copyright:"© 2020 Denis Pushkarev (zloirock.ru)"})})),G=0,W=Math.random(),K=function(t){return"Symbol("+String(void 0===t?"":t)+")_"+(++G+W).toString(36)},Q=q("keys"),Y={},H=u.WeakMap;if($){var J=C.state||(C.state=new H),U=J.get,X=J.has,Z=J.set;D=function(t,e){return e.facade=t,Z.call(J,t,e),e},I=function(t){return U.call(J,t)||{}},B=function(t){return X.call(J,t)}}else{var tt=Q[F="state"]||(Q[F]=K(F));Y[tt]=!0,D=function(t,e){return e.facade=t,k(t,tt,e),e},I=function(t){return j(t,tt)?t[tt]:{}},B=function(t){return j(t,tt)}}var et,nt,rt={set:D,get:I,has:B,enforce:function(t){return B(t)?I(t):D(t,{})},getterFor:function(t){return function(e){var n;if(!w(e)||(n=I(e)).type!==t)throw TypeError("Incompatible receiver, "+t+" required");return n}}},ot=o((function(t){var e=rt.get,n=rt.enforce,r=String(String).split("String");(t.exports=function(t,e,o,i){var c,f=!!i&&!!i.unsafe,a=!!i&&!!i.enumerable,l=!!i&&!!i.noTargetGet;"function"==typeof o&&("string"!=typeof e||j(o,"name")||k(o,"name",e),(c=n(o)).source||(c.source=r.join("string"==typeof e?e:""))),t!==u?(f?!l&&t[e]&&(a=!0):delete t[e],a?t[e]=o:k(t,e,o)):a?t[e]=o:z(e,o)})(Function.prototype,"toString",(function(){return"function"==typeof this&&e(this).source||L(this)}))})),it=u,ut=function(t){return"function"==typeof t?t:void 0},ct=function(t,e){return arguments.length<2?ut(it[t])||ut(u[t]):it[t]&&it[t][e]||u[t]&&u[t][e]},ft=Math.ceil,at=Math.floor,lt=function(t){return isNaN(t=+t)?0:(t>0?at:ft)(t)},st=Math.min,pt=function(t){return t>0?st(lt(t),9007199254740991):0},yt=Math.max,ht=Math.min,bt=function(t){return function(e,n,r){var o,i=v(e),u=pt(i.length),c=function(t,e){var n=lt(t);return n<0?yt(n+e,0):ht(n,e)}(r,u);if(t&&n!=n){for(;u>c;)if((o=i[c++])!=o)return!0}else for(;u>c;c++)if((t||c in i)&&i[c]===n)return t||c||0;return!t&&-1}},dt={includes:bt(!0),indexOf:bt(!1)}.indexOf,gt=["constructor","hasOwnProperty","isPrototypeOf","propertyIsEnumerable","toLocaleString","toString","valueOf"].concat("length","prototype"),vt={f:Object.getOwnPropertyNames||function(t){return function(t,e){var n,r=v(t),o=0,i=[];for(n in r)!j(Y,n)&&j(r,n)&&i.push(n);for(;e.length>o;)j(r,n=e[o++])&&(~dt(i,n)||i.push(n));return i}(t,gt)}},wt={f:Object.getOwnPropertySymbols},mt=ct("Reflect","ownKeys")||function(t){var e=vt.f(_(t)),n=wt.f;return n?e.concat(n(t)):e},Ot=function(t,e){for(var n=mt(e),r=M.f,o=x.f,i=0;i<n.length;i++){var u=n[i];j(t,u)||r(t,u,o(e,u))}},jt=/#|\.prototype\./,St=function(t,e){var n=Tt[Pt(t)];return n==xt||n!=Et&&("function"==typeof e?c(e):!!e)},Pt=St.normalize=function(t){return String(t).replace(jt,".").toLowerCase()},Tt=St.data={},Et=St.NATIVE="N",xt=St.POLYFILL="P",_t=St,At=x.f,Mt=Array.isArray||function(t){return"Array"==h(t)},kt=function(t){return Object(g(t))},zt=function(t,e,n){var r=m(e);r in t?M.f(t,r,p(0,n)):t[r]=n},Rt=!!Object.getOwnPropertySymbols&&!c((function(){return!String(Symbol())})),Ct=Rt&&!Symbol.sham&&"symbol"==typeof Symbol.iterator,Vt=q("wks"),Dt=u.Symbol,It=Ct?Dt:Dt&&Dt.withoutSetter||K,Bt=function(t){return j(Vt,t)||(Rt&&j(Dt,t)?Vt[t]=Dt[t]:Vt[t]=It("Symbol."+t)),Vt[t]},Ft=Bt("species"),Lt=function(t,e){var n;return Mt(t)&&("function"!=typeof(n=t.constructor)||n!==Array&&!Mt(n.prototype)?w(n)&&null===(n=n[Ft])&&(n=void 0):n=void 0),new(void 0===n?Array:n)(0===e?0:e)},Nt=ct("navigator","userAgent")||"",$t=u.process,qt=$t&&$t.versions,Gt=qt&&qt.v8;Gt?nt=(et=Gt.split("."))[0]+et[1]:Nt&&(!(et=Nt.match(/Edge\/(\d+)/))||et[1]>=74)&&(et=Nt.match(/Chrome\/(\d+)/))&&(nt=et[1]);var Wt,Kt=nt&&+nt,Qt=Bt("species"),Yt=Bt("isConcatSpreadable"),Ht=9007199254740991,Jt="Maximum allowed index exceeded",Ut=Kt>=51||!c((function(){var t=[];return t[Yt]=!1,t.concat()[0]!==t})),Xt=(Wt="concat",Kt>=51||!c((function(){var t=[];return(t.constructor={})[Qt]=function(){return{foo:1}},1!==t[Wt](Boolean).foo}))),Zt=function(t){if(!w(t))return!1;var e=t[Yt];return void 0!==e?!!e:Mt(t)};function te(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}function ee(t,e){for(var n=0;n<e.length;n++){var r=e[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(t,r.key,r)}}function ne(t){return(ne=Object.setPrototypeOf?Object.getPrototypeOf:function(t){return t.__proto__||Object.getPrototypeOf(t)})(t)}function re(t,e){return(re=Object.setPrototypeOf||function(t,e){return t.__proto__=e,t})(t,e)}function oe(t,e){return!e||"object"!=typeof e&&"function"!=typeof e?function(t){if(void 0===t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return t}(t):e}function ie(t){var e=function(){if("undefined"==typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"==typeof Proxy)return!0;try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(t){return!1}}();return function(){var n,r=ne(t);if(e){var o=ne(this).constructor;n=Reflect.construct(r,arguments,o)}else n=r.apply(this,arguments);return oe(this,n)}}function ue(t,e,n){return(ue="undefined"!=typeof Reflect&&Reflect.get?Reflect.get:function(t,e,n){var r=function(t,e){for(;!Object.prototype.hasOwnProperty.call(t,e)&&null!==(t=ne(t)););return t}(t,e);if(r){var o=Object.getOwnPropertyDescriptor(r,e);return o.get?o.get.call(n):o.value}})(t,e,n||t)}!function(t,e){var n,r,o,i,c,f=t.target,a=t.global,l=t.stat;if(n=a?u:l?u[f]||z(f,{}):(u[f]||{}).prototype)for(r in e){if(i=e[r],o=t.noTargetGet?(c=At(n,r))&&c.value:n[r],!_t(a?r:f+(l?".":"#")+r,t.forced)&&void 0!==o){if(typeof i==typeof o)continue;Ot(i,o)}(t.sham||o&&o.sham)&&k(i,"sham",!0),ot(n,r,i,t)}}({target:"Array",proto:!0,forced:!Ut||!Xt},{concat:function(t){var e,n,r,o,i,u=kt(this),c=Lt(u,0),f=0;for(e=-1,r=arguments.length;e<r;e++)if(Zt(i=-1===e?u:arguments[e])){if(f+(o=pt(i.length))>Ht)throw TypeError(Jt);for(n=0;n<o;n++,f++)n in i&&zt(c,f,i[n])}else{if(f>=Ht)throw TypeError(Jt);zt(c,f++,i)}return c.length=f,c}});var ce=function(t){return void 0!==t.$el.data("resizableColumns")},fe=function(t){t.options.resizable&&!t.options.cardView&&!ce(t)&&t.$el.is(":visible")&&t.$el.resizableColumns({store:window.store})},ae=function(t){ce(t)&&t.$el.data("resizableColumns").destroy()},le=function(t){ae(t),fe(t)};n.default.extend(n.default.fn.bootstrapTable.defaults,{resizable:!1}),n.default.BootstrapTable=function(t){!function(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function");t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,writable:!0,configurable:!0}}),e&&re(t,e)}(i,t);var e,n,r,o=ie(i);function i(){return te(this,i),o.apply(this,arguments)}return e=i,(n=[{key:"initBody",value:function(){for(var t,e=this,n=arguments.length,r=new Array(n),o=0;o<n;o++)r[o]=arguments[o];(t=ue(ne(i.prototype),"initBody",this)).call.apply(t,[this].concat(r)),this.$el.off("column-switch.bs.table page-change.bs.table").on("column-switch.bs.table page-change.bs.table",(function(){le(e)}))}},{key:"toggleView",value:function(){for(var t,e=arguments.length,n=new Array(e),r=0;r<e;r++)n[r]=arguments[r];(t=ue(ne(i.prototype),"toggleView",this)).call.apply(t,[this].concat(n)),this.options.resizable&&this.options.cardView&&ae(this)}},{key:"resetView",value:function(){for(var t,e=this,n=arguments.length,r=new Array(n),o=0;o<n;o++)r[o]=arguments[o];(t=ue(ne(i.prototype),"resetView",this)).call.apply(t,[this].concat(r)),this.options.resizable&&setTimeout((function(){fe(e)}),100)}}])&&ee(e.prototype,n),r&&ee(e,r),i}(n.default.BootstrapTable)}));