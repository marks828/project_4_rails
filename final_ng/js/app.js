

angular
  .module("betApp", ["ui.router", "ngResource"])
  .config(["$stateProvider", Router])
  .factory("BetsFactory", ["$resource", BetsFactoryFunction])
  .controller("betsCtrl", ["BetsFactory", betsCtrl])
  .controller("betShowCtrl", ["BetsFactory", "$stateParams", betShowCtrl])


function BetsFactoryFunction($resource){
  return $resource("http://localhost:3000/bets/:id")
}

function betsController (BetsFactory){
  console.log("controller");
  this.bets = BetsFactory.query()
}

function betShowCtrl(BetsFactory, $stateParams){
  this.bet = BetsFactory.get({id: $stateParams.id})
  console.log(betShowCtrl);
}



function Router($stateProvider){
  console.log("router working");
  $stateProvider
  .state("betIndex", {
    url:"/bets",
    controller:"betsCtrl",
    controllerAs:"vm",
    templateUrl:"js/ng-views/bets.html"
  })
  .state("betShow", {
    url:"/bets/:id",
    controller:"betShowCtrl",
    controllerAs:"vm",
    templateUrl:"js/ng-views/show.html"
  })
}
