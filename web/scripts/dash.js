/* global asideDiv */

//Agregando aside 
import {aside} from './aside.js';
import {vendedorDashBoard} from './vendedorDashBoard.js';
import {adminDashBoard} from'./adminDashBoard.js';

document.addEventListener("DOMContentLoaded",()=>{
  const gerente=document.querySelector("#gerente");
  const vendedor=document.querySelector("#vendedor");
  const admin=document.querySelector("#admin");

  console.log(vendedor)
  if(gerente){
      
      gerente.innerHTML=aside;
  }
  if(vendedor){
       vendedor.innerHTML=vendedorDashBoard;
  }
  if(admin){
       admin.innerHTML=adminDashBoard;
  }
  
  
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");

  closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
 
    menuBtnChange();
  });

//  searchBtn.addEventListener("click", ()=>{ 
//    sidebar.classList.toggle("open");
//    
//    menuBtnChange(); 
//  });

 
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
      
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");
   }
  }
});

