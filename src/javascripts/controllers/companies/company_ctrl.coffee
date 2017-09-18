angular.module('mediMeet').controller 'CompanyCtrl', (comp, $state) ->
	@company = comp.company
	@company.posts = comp.posts
	
	@viewInterest = (id) ->
		$state.go('root.interest.hidden', {id: id})

	this