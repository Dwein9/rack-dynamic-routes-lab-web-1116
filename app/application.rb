class Application

  @@items = []

    def call(env)

    request = Rack::Request.new(env)
    resp = Rack::Response.new

    if request.path.match(/items/)
      item_name = request.path.split("/items/").last

      if new_item= @@items.find {|i| i.name == item_name}
        resp.write new_item.price
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
