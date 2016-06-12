describe UserAgent do
  let(:user_agent) { UserAgent.new(request) }
  let(:request_from_android) { 'Android' }
  let(:request_from_ios) { 'iPhone' }
  let(:request_from_pc) { 'Chrome' }

  context '#android?' do
    context 'Androidからのrequestだった場合' do
      let(:request) { request_from_android }
      it { expect(user_agent.android?).to be true }
    end

    context 'iOSからのrequestだった場合' do
      let(:request) { request_from_ios }
      it { expect(user_agent.android?).to be false }
    end

    context 'PCからのrequestだった場合' do
      let(:request) { request_from_pc }
      it { expect(user_agent.android?).to be false }
    end
  end

  context '#ios?' do
    context 'Androidからのrequestだった場合' do
      let(:request) { request_from_android }
      it { expect(user_agent.ios?).to be false }
    end

    context 'iOSからのrequestだった場合' do
      let(:request) { request_from_ios }
      it { expect(user_agent.ios?).to be true }
    end

    context 'PCからのrequestだった場合' do
      let(:request) { request_from_pc }
      it { expect(user_agent.ios?).to be false }
    end
  end

  context '#mobile?' do
    context 'Androidからのrequestだった場合' do
      let(:request) { request_from_android }
      it { expect(user_agent.mobile?).to be true }
    end

    context 'iOSからのrequestだった場合' do
      let(:request) { request_from_ios }
      it { expect(user_agent.mobile?).to be true }
    end

    context 'PCからのrequestだった場合' do
      let(:request) { request_from_pc }
      it { expect(user_agent.mobile?).to be false }
    end
  end
end

