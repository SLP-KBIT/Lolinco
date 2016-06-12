feature 'get /' do
  background do
    visit '/'
  end

  scenario do
    expect(page).to have_content 'hello sinatra'
  end

  scenario 'button click', js: true do
    click_button 'hello sinatra'
    expect(page).to have_content 'hoge'
  end
end

