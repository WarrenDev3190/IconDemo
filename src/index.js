var Elm = require('./elm/Main.elm');

$(document).ready(function init() {
  Elm.Main.embed(document.getElementById('app'));
});

setTimeout(function () {
  var healthProgress = new ProgressBar.Circle('.trophy-one', {
      color: '#FECC49',
      strokeWidth: 3,
      trailWidth: 1,
      text: {
          value: '40%'
      }
  });
  healthProgress.animate(.40);

  var nursingProgress = new ProgressBar.Circle('.trophy-two', {
      color: '#FECC49',
      strokeWidth: 3,
      trailWidth: 1,
      text: {
          value: '23%'
      }
  });
  nursingProgress.animate(.23);

  var patientProgress = new ProgressBar.Circle('.trophy-three', {
      color: '#32CD6F',
      strokeWidth: 3,
      trailWidth: 1,
      text: {
          value: '90%'
      }
  });
  patientProgress.animate(.9);

  var strategyProgress = new ProgressBar.Circle('.trophy-four', {
      color: '#EC3C62',
      strokeWidth: 3,
      trailWidth: 1,
      text: {
          value: '15%'
      }
  });
  strategyProgress.animate(.15);

  var ctx = $('#canvas');

  var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
          {
              label: "Med Surg Unit Current Trajectory",
              fill: false,
              lineTension: 0.1,
              backgroundColor: "rgba(75,192,192,0.4)",
              borderColor: "rgba(75,192,192,1)",
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'miter',
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              data: [65, 59, 80, 81, 77, 76, 54],
              spanGaps: false,
          },
          {
              label: "Med Surg Unit Prescribed",
              fill: false,
              lineTension: 0.1,
              backgroundColor: "rgba(50, 205, 111, .4)",
              borderColor: "rgba(50, 205, 111, 1)",
              borderCapStyle: 'butt',
              borderDash: [],
              borderDashOffset: 0.0,
              borderJoinStyle: 'miter',
              pointBorderColor: "rgba(50, 205, 111, 1)",
              pointBackgroundColor: "#fff",
              pointBorderWidth: 1,
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "rgba(50, 205, 111, 1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointHoverBorderWidth: 2,
              pointRadius: 1,
              pointHitRadius: 10,
              data: [65, 44, 80, 81, 82, 93, 100],
              spanGaps: false,
          }
      ]
};
  var progressChart = new Chart(ctx, {
    type: 'line',
    data: data,
    options: {
      display: true
    }
  });
}, 1000);
