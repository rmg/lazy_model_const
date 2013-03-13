require 'lazy_const/spec'

module LazyModelConst::ExtendedModelMixins
  def defines_model_consts(*consts)
    defines_consts(*consts)
    consts.each do |const|
      it "defined constant #{const} is a valid #{described_class}" do
        described_class.public_send(const.to_sym).should be_valid
      end
    end
  end
  alias_method :defines_model_const, :defines_model_consts
end

RSpec.configure do |config|
  config.extend  LazyModelConst::ExtendedModelMixins, type: :model
end
