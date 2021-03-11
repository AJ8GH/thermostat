feature 'power saving mode' do
  scenario 'it is on by default' do
    visit '/'

    expect(page).to have_content('Thermostat')
    expect(page.find('#psm-status')).to have_content 'On'
    expect(current_path).to eq '/'
  end

  scenario 'it can be turned off and on' do
    visit '/'

    expect(page.find('#psm-status')).to have_content 'On'
    expect(page.find('#psm-status')).not_to have_content 'Off'

    page.find('#psm-off').click

    expect(page.find('#psm-status')).to have_content 'Off'
    expect(page.find('#psm-status')).not_to have_content 'On'

    page.find('#psm-on').click

    expect(page.find('#psm-status')).to have_content 'On'
    expect(page.find('#psm-status')).not_to have_content 'Off'
  end

  scenario 'it sets max temperature to 25 when on' do
    visit '/'

    expect(page.find('#psm-status')).to have_content 'On'
    expect(page.find('#temperature')).to have_content '20'

    10.times { page.find('#up').click }
    expect(page.find('#temperature')).to have_content '25'

    10.times { page.find('#up').click }
    expect(page.find('#temperature')).to have_content '25'
  end
end
