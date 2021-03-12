feature 'persisting temperature settings' do
  scenario 'temparature persists across session' do
    visit '/'

    expect(page).to have_content('Thermostat')
    expect(page.find('#temperature')).to have_content 20
    expect(page).not_to have_css('#temperature', text: '21')

    click_button('up')

    expect(page).to have_css('#temperature', text: '21')
    expect(page).not_to have_css('#temperature', text: '20')

    visit '/'

    expect(page).to have_css('#temperature', text: '21')
    expect(page).not_to have_css('#temperature', text: '20')
  end
end
