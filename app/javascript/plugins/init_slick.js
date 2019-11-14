import slick from 'slick-carousel'

const initSlick = $(document).ready(function(){
  $('.cards-bidding').slick({
    autoplay: true,
    autoplaySpeed: 4000,
    infinite: true,
    speed: 400,
    slidesToShow: 4.5,
    slidesToSroll: 2,
    centerMode: true,
    arrows: false,
    pauseOnFocus:true,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3.5,
          slidesToScroll: 1,
          infinite: true,
          dots: false,
        }
      },
      {
        breakpoint: 800,
        settings: {
          slidesToShow: 2.5,
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
