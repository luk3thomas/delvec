# delvec

A small curried library for fetching properties from objects.

Get properties from JSON.

```javascript
json = {
  "name": "Foo"
};

var fromJson = delvec(json);

fromJson('name');    // 'Foo'
fromJson('a.b.c');   // undefined
```


It also works in reverse order.

```javascript
json = [
  { "name": "Foo" },
  { "name": "Bar" },
  { "name": "Baz" }
];

var name = delvec('name');

name(json[0]);    // 'Foo'
name(json[1]);    // 'Bar'
name(json[2]);    // 'Baz'
```


Set defaults if `delvec` is empty handed.

```javascript
json = [
  { "name": "Foo", order: 1 },
  { "name": "Bar", order: 2 },
  { "name": "Baz" }
];

var order = delvec.or(0, 'order');

order(json[0]);    // 1
order(json[1]);    // 2
order(json[2]);    // 0
```

