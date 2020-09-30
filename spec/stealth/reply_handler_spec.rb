RSpec.describe Stealth::Services::Postback::ReplyHandler do
  let(:recipient_id) { 'xyz_jmj_id' }

  let(:reply) { Stealth::Reply.new(unstructured_reply: unstructured_reply) }
  let(:handler) { Stealth::Services::Postback::ReplyHandler.new(recipient_id: recipient_id, reply: reply) }
  let(:subject) { handler.send(reply.reply_type) }

  context 'with a text reply' do
    let(:unstructured_reply) do
      {
        'reply_type' => 'text',
        'text' => 'Hello Oxygene!'
      }
    end

    it 'sends the appropriate schema' do
      expect(subject).to match_schema('text_request')
    end
  end

  context 'with a option selection reply' do
    let(:unstructured_reply) do
      {
        'reply_type' => 'text',
        'text' => 'Choose an album',
        'buttons' => [
          {
            'type' => 'payload',
            'text' => 'Equinoxe',
            'payload' => { year: 1978 }.to_json
          },
          {
            'type' => 'payload',
            'text' => 'Oxygene',
            'payload' => { year: 1976 }.to_json
          }
        ]
      }
    end

    it 'sends the appropriate schema' do
      expect(subject).to match_schema('buttons_request')
    end
  end
end
