import slick from 'slick-carousel'

const initSlick = $(document).ready(function(){
  $('.cards-bidding').slick({
    autoplaySpeed: 4000,
    speed: 400,
    slidesToShow: 5,
    slidesToSroll: 3,
    centerMode: true,
    arrows: true,
    pauseOnFocus:true,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 4.5,
          slidesToScroll: 3,
          infinite: true,
          dots: false,
        }
      },
      {
        breakpoint: 800,
        settings: {
          slidesToShow: 3.5,
          slidesToScroll: 1,
        }
      },
      {
        breakpoint: 540,
        settings: {
          slidesToShow: 2.5,
          slidesToScroll: 1,
        }
      }
    ]
  });
});

export{ initSlick };
