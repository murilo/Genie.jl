@safetestset "Advanced rendering" begin

  @safetestset "for_each renders local variables" begin
    using Genie
    using Genie.Renderer.Html

    view = raw"""
<ol>
<% for_each(["a", "b", "c"]) do letter %>
<li>$(letter)</li>
<% end %>
</ol>"""

    r = html(view)

    @test String(r.body) == "<!DOCTYPE html><html><body><ol><li>a</li><li>b</li><li>c</li></ol></body></html>"
  end;

  @safetestset "for_each can not access module variables" begin
    using Genie
    using Genie.Renderer.Html

    x = 100

    view = raw"""
<ol>
<% for_each(["a", "b", "c"]) do letter %>
<li>$(letter) = $x</li>
<% end %>
</ol>"""

    @test_throws UndefVarError html(view)
  end;

  @safetestset "for_each can access view variables" begin
    using Genie
    using Genie.Renderer.Html

    view = raw"""
<ol>
<% for_each(["a", "b", "c"]) do letter %>
<li>$(letter) = $(vars(:x))</li>
<% end %>
</ol>"""

    r = html(view, x = 100)

    @test String(r.body) == "<!DOCTYPE html><html><body><ol><li>a = 100</li><li>b = 100</li><li>c = 100</li></ol></body></html>"
  end;

  @safetestset "for_each can access context variables" begin
    using Genie
    using Genie.Renderer.Html

    view = raw"""
<ol>
<% for_each(["a", "b", "c"]) do letter %>
<li>$(letter) = $x</li>
<% end %>
</ol>"""

    r = html(view, context = @__MODULE__, x = 200)

    @test String(r.body) == "<!DOCTYPE html><html><body><ol><li>a = 200</li><li>b = 200</li><li>c = 200</li></ol></body></html>"
  end;
end;