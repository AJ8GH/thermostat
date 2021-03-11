feature 'temperature display' do
  scenario 'it is 20 by default' do
    visit '/'

    expect(page).to have_content('Thermostat')
    expect(page.find('#temperature')).to have_content 20
    expect(current_path).to eq '/'
  end

  scenario 'it can be increased' do
    visit '/'

    expect(page.find('#temperature')).to have_content 20
    expect(page.find('#temperature')).not_to have_content 21

    page.find('#up').click

    expect(page.find('#temperature')).to have_content 21
    expect(page.find('#temperature')).not_to have_content 20
  end

  scenario 'it can be decreased' do
    visit '/'

    expect(page.find('#temperature')).to have_content 20
    expect(page.find('#temperature')).not_to have_content 19

    page.find('#down').click

    expect(page.find('#temperature')).to have_content 19
    expect(page.find('#temperature')).not_to have_content 20
  end

  scenario 'it can be reset' do
    visit '/'

    expect(page.find('#temperature')).to have_content 20
    expect(page.find('#temperature')).not_to have_content 19

    page.find('#down').click

    expect(page.find('#temperature')).to have_content 19
    expect(page.find('#temperature')).not_to have_content 20

    page.find('#reset').click

    expect(page.find('#temperature')).to have_content 20
    expect(page.find('#temperature')).not_to have_content 19
  end
end
