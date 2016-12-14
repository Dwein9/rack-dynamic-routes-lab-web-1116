class Application

    def call(env)

    request = Rack::Request.new(env)
    resp = Rack::Response.new

    if request.path.match(/items/)
      item_name = request.path.split("/items/").last

      if item_name = @@items.find {|i| i.name == item_name}
        resp.write item_name.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
