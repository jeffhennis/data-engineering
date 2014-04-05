require 'omniauth-openid'
require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end

OmniAuth.config.on_failure = ChallengeController.action(:logout)

#http://localhost:3000/auth/google/callback?_method=post&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.mode=id_res&openid.op_endpoint=https%3A%2F%2Fwww.google.com%2Faccounts%2Fo8%2Fud&openid.response_nonce=2014-04-05T13%3A20%3A48ZOQcnE0801fdeWw&openid.return_to=http%3A%2F%2Flocalhost%3A3000%2Fauth%2Fgoogle%2Fcallback%3F_method%3Dpost&openid.assoc_handle=1.AMlYA9WYx4v80dKZpMFk3-k-DOyySJkPJ-qypV5JPTJ2yEICg9H2TSr9HciyIzO2&openid.signed=op_endpoint%2Cclaimed_id%2Cidentity%2Creturn_to%2Cresponse_nonce%2Cassoc_handle%2Cns.ext1%2Cext1.mode%2Cext1.type.ext2%2Cext1.value.ext2%2Cext1.type.ext3%2Cext1.value.ext3%2Cext1.type.ext0%2Cext1.value.ext0&openid.sig=sZuZHWxLfUMui0lZ3EUgvkUDqJM%3D&openid.identity=https%3A%2F%2Fwww.google.com%2Faccounts%2Fo8%2Fid%3Fid%3DAItOawn713Lw-_9V23zqfUtE8Ac5QTE9IriguUw&openid.claimed_id=https%3A%2F%2Fwww.google.com%2Faccounts%2Fo8%2Fid%3Fid%3DAItOawn713Lw-_9V23zqfUtE8Ac5QTE9IriguUw&openid.ns.ext1=http%3A%2F%2Fopenid.net%2Fsrv%2Fax%2F1.0&openid.ext1.mode=fetch_response&openid.ext1.type.ext2=http%3A%2F%2Faxschema.org%2FnamePerson%2Ffirst&openid.ext1.value.ext2=Jeff&openid.ext1.type.ext3=http%3A%2F%2Faxschema.org%2FnamePerson%2Flast&openid.ext1.value.ext3=Hennis&openid.ext1.type.ext0=http%3A%2F%2Faxschema.org%2Fcontact%2Femail&openid.ext1.value.ext0=jeff.hennis%40gmail.com#