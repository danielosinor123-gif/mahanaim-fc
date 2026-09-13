// Mahanaim FC — shared JS (<10KB): nav, filters, form validation, mailto compose.
(function(){
"use strict";
var btn=document.querySelector(".menu-btn"),nav=document.querySelector("nav.main");
if(btn&&nav){btn.addEventListener("click",function(){var o=nav.classList.toggle("open");btn.setAttribute("aria-expanded",o?"true":"false");});}
// Footer year
document.querySelectorAll("[data-year]").forEach(function(e){e.textContent=new Date().getFullYear();});
// News + players client filter (?cat= / data-cat)
var f=document.querySelector("[data-filter]");
if(f){var items=document.querySelectorAll("[data-cat]");var apply=function(){var v=f.value;items.forEach(function(i){i.style.display=(!v||i.getAttribute("data-cat")===v)?"":"none";});var empty=document.querySelector("[data-empty]");if(empty){var vis=0;items.forEach(function(i){if(i.style.display!=="none")vis++;});empty.style.display=vis?"none":"";}};f.addEventListener("change",apply);var q=new URLSearchParams(location.search).get("cat");if(q){f.value=q;apply();}}
// Generic enquiry validation + structured mailto + queue
document.querySelectorAll("form[data-enquiry]").forEach(function(form){
form.addEventListener("submit",function(ev){
ev.preventDefault();
var ok=true;var first=null;
form.querySelectorAll("[required]").forEach(function(el){
var bad=!el.value||(el.type==="checkbox"&&!el.checked)||(el.pattern&&!(new RegExp("^(?:"+el.pattern+")$").test(el.value)));
el.setAttribute("aria-invalid",bad?"true":"false");
var msg=el.closest(".field")?el.closest(".field").querySelector(".err"):null;
if(msg)msg.style.display=bad?"":"none";
if(bad){ok=false;first=first||el;}
});
var note=form.querySelector("[data-form-note]");
if(!ok){if(note){note.textContent="Please complete the highlighted fields.";note.style.display="";}if(first)first.focus();return;}
var data={};new FormData(form).forEach(function(v,k){data[k]=v;});
data._category=form.getAttribute("data-enquiry");data._at=new Date().toISOString();
try{var q=JSON.parse(localStorage.getItem("mfc_enquiries")||"[]");q.push(data);localStorage.setItem("mfc_enquiries",JSON.stringify(q));}catch(e){}
var to=form.getAttribute("data-to")||"mahanaimfc@hotmail.com";
var subject=encodeURIComponent("[Mahanaim FC] "+data._category+" — "+(data.name||"New enquiry"));
var body=encodeURIComponent(Object.keys(data).map(function(k){return k+": "+data[k];}).join("\n")+"\n\n— Sent from mahanaimfc.com enquiry hub. Submitting does not guarantee selection or contract.");
if(note){note.textContent="Thank you. Your enquiry is ready to send — your email app will open now. We also saved it on this device.";note.style.display="";note.className="notice";}
window.location.href="mailto:"+to+"?subject="+subject+"&body="+body;
form.reset();
});
});
})();
