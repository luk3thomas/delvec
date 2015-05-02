describe "delvec", ->

  beforeEach ->
    @delvec = require "../"
    @object =
      foo:
        bar:
          baz: 1

  it "gets a value from object", ->
    expect(@delvec("foo.bar.baz", @object)).toBe 1

  it "returns undefined as missing prop", ->
    expect(@delvec("foo.bar.qux", @object)).toBeUndefined()

  it "does not throw an error on missing prop", ->
    expect(=> @delvec("foo.bar.qux", @object)).not.toThrow()

  it "is curried", ->
    expect(@delvec("foo.bar.baz", @object)).toBe 1
    expect(@delvec("foo.bar.baz")(@object)).toBe 1

  it "can accept params in reverse order", ->
    expect(@delvec(@object, "foo.bar.baz")).toBe 1


  describe ".or", ->

    it "returns alternative if missing prop", ->
      expect(@delvec.or([], "foo.bar.qux", @object)).toEqual []

    it "is curried", ->
      expect(@delvec.or([])("foo.bar.qux", @object)).toEqual []
      expect(@delvec.or([], "foo.bar.qux")(@object)).toEqual []
      expect(@delvec.or([])("foo.bar.qux")(@object)).toEqual []
