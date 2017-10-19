 <%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <!--- Carousel -->

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" data-interval="50">
    <div class="item active">
      <img src="images/Subterranean_parking_lot.jpg" alt="..."/>
     
    </div>
    <div class="item"">
      <img src="images/parking_lot_1061671_ver1.0_1280_720.jpg" alt="..."/>
     
    </div>
    <div class="item">
      <<img src="images/parkinglotattendant_RAW_2975317_ver1.0_1280_720.jpg"  alt="..."/>
      
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

        <!--- Carousel -->

    </div>
        <br/>
        <br/>
        <!--- Middle Contents -->
        <div class="container center">
            <div class="row">
                <div class="col-lg-4">
                    <img class="img-circle" src="images/download (1).png" alt="thumb01" width="140" height="140" />
                    <h2>SEARCH</h2>
                    <p>Search and compare all available parking options and prices at thousands of parking lots and garages in 40 cities in real-time.</p>
                    <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle" src="images/images (1).png" alt="thumb02" width="140" height="140" />
                    <h2>BOOK</h2>
                    <p>Pre-purchase the perfect spot and have a guaranteed space waiting for you when you need it.</p>
                    <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle" src="images/download (4).jpg" alt="thumb03" width="140" height="140" />
                    <h2>PARK HAPPY</h2>
                    <p>Redeem your purchase seamlessly at your selected location! It’s that easy. Save time and money with hassle-free parking.</p>
                    <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
            </div>
        </div>
        <!--- Middle Contents -->

</asp:Content>

