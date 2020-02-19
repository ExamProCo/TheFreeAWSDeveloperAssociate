var data = {
  title: 'Hello World!',
  selected: null,
  question: 'In the Battle of Wolf 359 what prominent Miranda-class ship was destroyed?',
  choices: [
    'A) USS Defiant',
    'B) USS Saratoga',
    'C) USS Yamaguchi',
    'D) USS Enterprise'
  ]
}

var Choice = {
  click: function(n){
    return function(){
      data.selected = n
    }
  },
  classes: function(n){
    if (data.selected === n){
      return 'active'
    } else {
      return ''
    }
  },
  view: function(vnode){
    var n = vnode.attrs.index
    return m('.choice',{ class: Choice.classes(n), onclick: Choice.click(n) },
      m('span.l'),
      m('span.v',data.choices[n])
    )
  }
}
var App = {
  submit: function(){
    m.request({
        method: "PUT",
        url: "<API-ENDPOINT>",
        params: {selected: data.selected},
    })
    .then(function(data) {
      console.log('data',data)
    })
  },
  view: function() {
    return m('main', [
      m("h1", data.title),
      m('article',
        m('h2','Question:'),
        m('.question',data.question),
        m(Choice,{index: 0}),
        m(Choice,{index: 1}),
        m(Choice,{index: 2}),
        m(Choice,{index: 3}),
        m('.submit',
          m("button", {onclick: App.submit}, 'Submit')
        )
      )
    ])
  }
}

m.mount(document.body, App)
