Given(/^a request is made for customer creation$/) do
  @test.given_a_request_for_customer_creation
end

When(/^creating that profile$/) do
  expect(@test.build_a_customer_from_request_params).to be true
end

Then(/^submit the request$/) do
  expect(@test.forward_request_to_data_source).to be true
end

Given(/^the new profile creation has been submitted$/) do
  expect(@test.customer_profile_has_been_submitted).to be true
end

When(/^informing the requestor$/) do
  expect(@test.validate_response_before_returning).to be true 
end

Then(/^return a well\-formed 'success' response$/) do
  expect(@test.return_success_response).to be false
end

When(/^the request fails$/) do
  expect(@test.failed_request).to be true
end

Then(/^return a well\-formed 'failure' response$/) do
  expect(@test.return_failed_response).to be false
end