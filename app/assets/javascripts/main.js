var app = angular.module('uplyApp', ['ui.compat', 'ngResource', 'templates'])

.run(function($rootScope) {
    $rootScope.$on('$viewContentLoaded', function () {
        $(document).foundation();
    });
});

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
                url: '/',
                views: {
                    'categories': {
                        templateUrl: '/categories/front',
                        controller: 'CategoryCtrl'
                    },
                    'categoryIndex': {
                        templateUrl: '/categories/index_template',
                        controller: 'CategoryCtrl'
                    },
                    'static_pages': {
                        templateUrl: '/logo',
                        controller: 'LogoCtrl'
                    },
                    'website': {
                        templateUrl: '/websites/d3',
                        controller: 'WebsiteCtrl'
                    },
                    'user': {
                        templateUrl: '/users/d3',
                        controller: 'UserCtrl'
                    },
                    'company': {
                        templateUrl: '/companies/d3',
                        controller: 'CompanyCtrl'
                    },
                }
            })
    }]);
	 
    app.factory('Website', function($resource)
	  	{
	  		  return $resource('/api/websites/:id');
	  	});

    app.factory('User', function($resource)
	  	{
	  		  return $resource('/api/users/:id');
	  	});
    
    app.factory('Company', function($resource)
	  	{
	  		  return $resource('/api/companies/:id');
	  	});
	  
    app.controller('WebsiteCtrl', ['$scope', 'Website', function($scope, Website){
      
        var website = Website.get({ id:gon.websiteId }, function(){
            $scope.webShow = website;
            console.log(website);
        });

        var fill = d3.scale.category20();

        $scope.words = ["hello","batman"]

			  d3.layout.cloud().size([800, 400])
			      .words($scope.words.map(function(d) {
			        return {text: d, size: 10 + Math.random() * 90};
			      }))
			      .padding(5)
			      .rotate(function() { return ~~(Math.random() * 2) * 90; })
			      .font("Impact")
			      .fontSize(function(d) { return d.size; })
			      .on("end", draw)
			      .start();

			  function draw(words) {
			    d3.select("div > section").append("svg:svg")
			    		.attr('class','svg-element')
			        .attr("width", 800)
			        .attr("height", 400)
			      .append("g")
			        .attr("transform", "translate(150,150)")
			      .selectAll("text")
			        .data(words)
			      .enter().append("text")
			        .style("font-size", function(d) { return d.size + "px"; })
			        .style("font-family", "Impact")
			        .style("fill", function(d, i) { return fill(i); })
			        .attr("text-anchor", "middle")
			        .attr("transform", function(d) {
			          return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
			        })
			        .text(function(d) { return d.text; });
			  };

	  }]);
    
    app.controller('UserCtrl', ['$scope', 'User', function($scope, User){
      
        var user = User.get({ id:gon.userId }, function(){
            $scope.userShow = user;
            console.log(user);
        });
	  }]);
    
    app.controller('CompanyCtrl', ['$scope', 'Company', function($scope, Company){
      
        var company = Company.get({ id:gon.companyId }, function(){
            $scope.companyShow = company;
            console.log(company);
        });
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
