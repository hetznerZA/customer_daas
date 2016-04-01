Given(/^a request is made for customer creation$/) do
  @test.given_a_request_for_customer_creation
end

When(/^creating that profile$/) do
  @test.build_a_customer_from_request_params
end

Then(/^submit the request$/) do
  @test.forward_request_to_relevant_service
end

Given(/^the new profile creation has been submitted$/) do
  @test.customer_profile_has_been_submitted
end

When(/^informing the requestor$/) do
  @test.validate_response_before_returning
end

Then(/^return a well\-formed 'success' response$/) do
  @test.return_success_response
end

Then(/^return a well\-formed 'failure' response$/) do
  @test_return_failure_response
end