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

  scenario 'power saving mode persists across session' do
    visit '/'

    expect(page.find('#psm-status')).to have_content 'On'
    expect(page.find('#psm-status')).not_to have_content 'Off'

    click_button('Off')

    expect(page.find('#psm-status')).to have_content 'Off'
    expect(page.find('#psm-status')).not_to have_content 'On'

    visit '/'

    expect(page.find('#psm-status')).to have_content 'Off'
    expect(page.find('#psm-status')).not_to have_content 'On'
  end
end
