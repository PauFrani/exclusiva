import slick from 'slick-carousel'

const initSlick = $(document).ready(function(){
  $('.cards-bidding').slick({
    dots: false,
    infinite: false,
    speed: 300,
    slidesToShow: 4.5,
    slidesToScroll: 4,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3.5,
          slidesToScroll: 3,
          infinite: true,
          dots: false
        }
      },
      {
        breakpoint: 800,
        settings: {
          slidesToShow: 3.5,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 540,
        settings: {
          slidesToShow: 2.5,
          slidesToScroll: 1
        }
      }
    ]
  });
});

export{ initSlick };
