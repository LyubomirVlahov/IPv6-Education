<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" 
CodeBehind="Default.aspx.cs" Inherits="WebApplication9.Default1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper row2">
      <div id="hpage_featured" class="clear">
        <div id="featured_slide">
          <ul>
            <li><img src="images/images1.gif" alt=" "/></li>
            <li><img src="images/images3.gif" alt=" "/></li>
            <li><img src="images/images4.gif" alt=" "/></li>
          </ul>
        </div>
        <!-- ###### -->
        <div class="intro clear">
          <div class="welcome clear"><img class="imgl" src="images/tu-sofia.gif" alt="" />
            <div class="fl_right">
            </div>
          </div>
          <div class="popular">
            <h2>Добре дошли в Технически Университет - София!</h2>
            <ul class="clear">
              <li><a href="http://tu-sofia.bg/index.html">&raquo; Технически Университет-София</a></li>
		      <li><a href="http://cs.tu-sofia.bg/">&raquo; Катедра "Компютърни системи"</a></li>
              <li><a href="http://pct.tu-sofia.bg/moodle001/login/index.php">&raquo; Катедра "Програмиране и компютърни технологии"</a></li>
		      <li><a href="http://ftk.tu-sofia.bg/">&raquo; Факултет по Телекомуникации</a></li>
              <li><a href="http://www.tu-sf.org/index.php/bg/">&raquo; Стопански факултет</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="homepage" class="clear">
          <!-- ###### -->
          <div id="content">
            <div id="top_featured" class="clear">        
                  <h1>Обучителна платформа</h1>
                  <img src="images/IPV66.jpg" />
                  <b>Тази обучителна платформа е направена, за да може да помогне, както на студенти, така и на преподаватели да се запознаят с новата версия на IP протокола.</b>
			      <b>Благодарение на платформата ще можете да разберете кои са предимствата на IPv6 спрямо IPv4 и защо бе нужно създаването на този протокол.</b>                     
            </div>       
          </div>
          <!-- ###### -->
          <div id="column">     
            <div class="holder last">
              <h2>Благодетели подпомогнали създаването на IPv6 лаборатория в Технически университет София</h2>
              <ul class="staffmembers">
            
                <li class="clear"><img class="imgl" src="images/Nakov.jpg"  />
                  <div class="fl_left">
                    <p><strong>проф. Огнян Наков</strong></p>
                    <p>Декан на ФКСУ</p>
                  </div>
                </li>
                <li class="clear"><img class="imgl" src="images/Trifonov.jpg"  />
                  <div class="fl_left">
                    <p><strong>доц. Румен Трифонов</strong></p>
                    <p>Началник отдел СО </p>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
</asp:Content>
