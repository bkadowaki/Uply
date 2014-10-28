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
            .state('main', {
                url: '/websites',
                views: {
                    'categories': {
                        templateUrl: '/categories/front',
                        controller: 'CategoryCtrl'
                    },
                    'static_pages': {
                        templateUrl: '/logo',
                        controller: 'LogoCtrl'
                    },
                    'categoryIndex': {
                        templateUrl: '/categories/index_template',
                        controller: 'CategoryCtrl'
                    },
                }
            })
            .state('main.website', {
                url: '/websites/:website_id',
                templateUrl: '/websites/d3',
                controller: function($stateParams) {
                    console.log($stateParams)
                }
            })
    }]);
	 
     app.factory('Website', function($resource)
	  		{
	  			return $resource('/api/websites/:id');
	  		});

	  app.controller('WebsiteCtrl', ['$scope', '$state', function($scope, $state){
      
        $state  
	  		var website = Website.get({}, function(){

	  		})
	  }]);
    
    app.factory('Category', function($resource) {
        return $resource('/api/categories/:id');
    });
  
    app.controller('CategoryCtrl', ['$scope', '$resource',  'Category', 'Website',  function($scope, $resource, Category, Website) {
		  	
        var categories = Category.query(function(){
            $scope.categoryList = categories;
            console.log(categories);
        });
        
        var websites = Website.query(function(){
            $scope.websiteList = websites;
            console.log(websites);
        });
    
        var WebsiteComScore = $resource('/api/websites/comscore');
 
        var website_comscore = WebsiteComScore.get(function(){
            $scope.websiteHighestComScore = website_comscore;
            console.log(website_comscore);
        });
        
        var CommentScore = $resource('/api/comments/top');
      
        var comment_score = CommentScore.get(function(){
            $scope.bestComment = comment_score;
            console.log(comment_score);
        });

        $scope.reverse = true;
		  	
        $scope.click = 1;
		  	
        $scope.setClick = function(currCategory){
		  		$scope.click = currCategory;
		  	};
		  	$scope.isSet = function(checkedTab){
		  		return $scope.click === checkedTab;
		  	};

		  	$scope.sort = 1;
        $scope.predicate;

		  	$scope.setSort = function(currSort){
          if (currSort == 1){
            $scope.predicate = 'websiteScore';
            console.log($scope.predicate);
          }
          else if (currSort == 2) {
            $scope.predicate = 'ups';
            console.log($scope.predicate);
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

