var app = angular.module('uplyApp', ['ui.compat', 'ngResource', 'templates']);

	  app.controller('NavCtrl', ['$scope','$http', function($scope, $http){
				$(document).on('scroll', function () {
				    if ($(this).scrollTop() > 50) {
				        if (!$('.top-bar').hasClass('expand')) {
				            $('.top-bar').addClass('expand');
				        }
				    } else {
				        if ($('.top-bar').hasClass('expand')) {
				            $('.top-bar').removeClass('expand');
				        }
				    };
				    $('#drop-signin')
				    	.mouseenter(function(){
				    		$('#signinvideo').get(0).play();
				    	})
				    	.mouseleave(function(){
				    		$('#signinvideo').get(0).pause();
				    	});
				    $('#drop-siteindex')
				    	.mouseenter(function(){
				    		$('#siteindexvideo').get(0).play();
				    	})
				    	.mouseleave(function(){
				    		$('#siteindexvideo').get(0).pause();
				    	});
				    $('#drop-signout')
				    	.mouseenter(function(){
				    		$('#signoutvideo').get(0).play();
				    	})
				    	.mouseleave(function(){
				    		$('#signoutvideo').get(0).pause();
				    	});
				});
			}
	  
    ]);
    
    app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
        $urlRouterProvider
            .otherwise('/');
      
        $stateProvider
            .state('homepage', {
                url: '/',
                views: {
                    'categories': {
                        templateUrl: '/categories',
                        controller: 'CategoryCtrl'
                    },
                    'static_pages': {
                        templateUrl: '/logo',
                        controller: 'LogoCtrl'
                    },
                }
            })

            .state('website', {
            	url: '/websites/:id', 
            	views: {
            		'websites': {
            			templateUrl: '/websites/d3',
            			controller: 'WebsiteCtrl'
            		},
            	}
            });
    }]);
    
    app.factory('Category', function($resource) {
        return $resource('/api/categories/:id');
    });
  
    app.controller('CategoryCtrl', ['$scope', 'Category', function($scope, Category) {
		  	
        var categories = Category.query(function(){
            $scope.categoryList = categories;
            console.log(categories);
        });

      
        $scope.predicate = 'score';
        $scope.reverse = true;
		  	
        $scope.click = 1;
		  	
        $scope.setClick = function(currCategory){
		  		$scope.click = currCategory;
		  	};
		  	$scope.isSet = function(checkedTab){
		  		return $scope.click === checkedTab;
		  	};

		  	$scope.sort = 1;
		  	$scope.setSort = function(currSort){
          if (currSort == 1){
            $scope.predicate = 'score';
          }
          else if (currSort == 2) {
            $scope.predicate = 'ups';
          }
		  		$scope.sort = currSort;
		  	};
		  	$scope.isSort = function(checkedSort){
		  		return $scope.sort === checkedSort;
		  	};

    }]); 

	  app.controller('LogoCtrl', ['$scope', function($scope){

	  			var moveUp = function(){
	  				$('#balloons').animate({
	  					top:'-=360px'},4000);
	  			}
	  			$(window).load(function(){
	  				moveUp();
	  			})
		  	}
	  ]);
    
    app.factory('Website', function($resource)
        {
          return $resource('/api/website/:id');
        });

    app.controller('WebsiteCtrl', ['$scope', function($scope){
        var website = Website.get({ id: 'params[:id]' }, function(){
            $scope.webShow = website; 
        })
    }]);

	  app.factory('Website', function($resource)
	  		{
	  			return $resource('/api/website/:id');
	  		});

	  app.controller('WebsiteCtrl', ['$scope', function($scope){
	  		var website = Website.get({}, function(){

	  		})
	  }]);
