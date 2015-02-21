LoadingState =
  resizeGame: () ->
    scale = 1
    if (window.innerWidth > window.innerHeight)
      scale = window.innerHeight / GameResolution.height
    else
      scale = window.innerWidth / GameResolution.width
    game.scale.setUserScale(scale, scale)
    game.scale.refresh()
  setScaling: () ->
    game.scale.scaleMode = Phaser.ScaleManager.USER_SCALE
    game.scale.pageAlignHorizontally = true
    game.scale.pageAlignVertically = true
    game.scale.setResizeCallback(this.resizeGame, this)
    this.resizeGame()

  preload: () ->
    game.load.spritesheet('big_button', 'img/big_button.png', 32 * 12, 32 * 4)
    game.load.spritesheet('small_button', 'img/small_button.png', 32 * 8, 2*64)
  load: () ->
  create: () ->
    this.setScaling()
    game.state.start('TitleScreen')
  update: () ->
