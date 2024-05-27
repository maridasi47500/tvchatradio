module ApplicationCable
    class Connection < ActionCable::Connection::Base
          identified_by :current_user

              def connect
                      self.current_user = find_verified_user
                          end

                  private
                        def find_verified_user
                          p cookies.encrypted
                                  if verified_user = User.find_by(id: cookies.encrypted[:user_id])
                                              verified_user
                                  elsif cookies and  cookies.encrypted['_session'] and verified_user = User.find_by(id: cookies.encrypted['_tvchatradio_session']['user_id'])

                                              verified_user

                                                      else
                                                                  reject_unauthorized_connection
                                                                          end
                                        end
                          end
end
