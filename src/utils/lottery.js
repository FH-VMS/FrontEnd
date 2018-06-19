
import jquery from 'jquery'
// (function() {
    let $ = function(id) {
        return document.getElementById(id);
    };
    let ele
    let container
    let canvas
    let num
    let prizes
    let btn
    let deg = 0
    let fnGetPrize
    let fnGotBack
    let optsPrize

let cssPrefix = {
    '': '',
    Webkit: 'webkit',
    Moz: '',
    O: 'o',
    ms: 'ms'
  }
 let eventPrefix = {
    '': '',
    Webkit: 'webkit',
    Moz: '',
    O: 'o',
    ms: 'ms'
  }
 let vendors = {
    '': '',
    Webkit: 'webkit',
    Moz: '',
    O: 'o',
    ms: 'ms'
  }
  let testEle = document.createElement('p')
  let cssSupport = {}

// 嗅探特性
Object.keys(vendors).some(function(vendor) {
  if (testEle.style[vendor + (vendor ? 'T' : 't') + 'ransitionProperty'] !== undefined) {
    cssPrefix = vendor ? '-' + vendor.toLowerCase() + '-' : '';
    eventPrefix = vendors[vendor];
    return true;
  }
});

/**
 * [兼容事件前缀]
 * @param  {[type]} name [description]
 * @return {[type]}      [description]
 */
function normalizeEvent(name) {
  return eventPrefix ? eventPrefix + name : name.toLowerCase();
}

/**
 * [兼容CSS前缀]
 * @param  {[type]} name [description]
 * @return {[type]}      [description]
 */
function normalizeCss(name) {
  name = name.toLowerCase();
  return cssPrefix ? cssPrefix + name : name;
}

cssSupport = {
  cssPrefix: cssPrefix,
  transform: normalizeCss('Transform'),
  transitionEnd: normalizeEvent('TransitionEnd')
}

var transform = cssSupport.transform;
var transitionEnd = cssSupport.transitionEnd;

// alert(transform);
// alert(transitionEnd);

function init(opts) {
  fnGetPrize = opts.getPrize;
  fnGotBack = opts.gotBack;
  
  opts.config(function(data) {
    prizes = opts.prizes = data;
    num = prizes.length;
    adapterCanvas(opts)
    draw(opts);
  });
  
  events();
}


/**
 * [绘制转盘]
 * @param  {String} id
* @param  {Number} 奖品份数
 */
function draw(opts) {
  opts = opts || {};
  if (!opts.id || num >>> 0 === 0) return; 

  let id = opts.id
  let rotateDeg = 360 / num / 2 + 90  // 扇形回转角度
  let ctx 
  let prizeItems = document.createElement('ul') // 奖项容器
  let turnNum = 1 / num  // 文字旋转 turn 值
  let html = []  // 奖项

  ele = $(id);
  
  canvas = ele.querySelector('.gb-turntable-canvas');
  container = ele.querySelector('.gb-turntable-container');
  btn = ele.querySelector('.gb-turntable-btn');

  if (!canvas.getContext) {
    showMsg('抱歉！浏览器不支持。');
    return;
  }
  // 获取绘图上下文
  ctx = canvas.getContext('2d');

  for (var i = 0; i < num; i++) {
    // 保存当前状态
    ctx.save();
    // 开始一条新路径
    ctx.beginPath();
    // 位移到圆心，下面需要围绕圆心旋转
    ctx.translate(opts.width / 2, opts.width / 2);
    // 从(0, 0)坐标开始定义一条新的子路径
    ctx.moveTo(0, 0);
    // 旋转弧度,需将角度转换为弧度,使用 degrees * Math.PI/180 公式进行计算。
    ctx.rotate((360 / num * i - rotateDeg) * Math.PI / 180);
    // 绘制圆弧
    ctx.arc(0, 0, opts.width / 2, 0, 2 * Math.PI / num, false);

    // 颜色间隔
    if (i % 2 == 0) {
        ctx.fillStyle = '#ffb820';
    } else {
        ctx.fillStyle = '#ffcb3f';
    }

    // 填充扇形
    ctx.fill();
    // 绘制边框
    ctx.lineWidth = 0.5;
    ctx.strokeStyle = '#e4370e';
    ctx.stroke();

    // 恢复前一个状态
    ctx.restore();

    // 奖项列表
    html.push('<li class="gb-turntable-item" style=""> <span style="' + transform + ': rotate(' + i * turnNum + 'turn);-webkit-transform-origin: 50% ' + opts.width / 2 + 'px;-ms-transform-origin: 50% ' + opts.width / 2 + 'px;transform-origin: 50% ' + opts.width / 2 + 'px;">' + opts.prizes[i].DisplayText + '</span> </li>');
    if ((i + 1) === num) {
      prizeItems.className = 'gb-turntalbe-list';
      container.appendChild(prizeItems);
      prizeItems.innerHTML = html.join('');
    }

  }

 

}

// 根据屏幕适应大小
function adapterCanvas(opts) {
 
  let ele = $(opts.id)
  let canvas = ele.querySelector('.gb-turntable-canvas');
  let btn = ele.querySelector('.gb-turntable-btn');
  let canvasWidth = opts.width 
  canvas.setAttribute('width', canvasWidth);
  canvas.setAttribute('height', canvasWidth);
  // jquery('#' + opts.id).height(canvasWidth + 'px')
  // jquery('#' + opts.id).width(canvasWidth + 'px')
  // ele.style.height = canvasWidth + 'px'
  // ele.style.width = canvasWidth + 'px'
  btn.style.left = canvasWidth / 2 - jquery('.gb-turntable-btn').width() / 2 + 'px'
  btn.style.marginTop = canvasWidth / 2 - jquery('.gb-turntable-btn').width() / 2 + 'px'
  
}

/**
 * [提示]
 * @param  {String} msg [description]
 */
function showMsg(msg) {
  alert(msg);
}

/**
 * [初始化转盘]
 * @return {[type]} [description]
 */
/*  function runInit() {
  removeClass(container, 'gb-run');
  container.style[transform] = 'rotate(0deg)';
  container.style[transform] = '';
}*/

/**
 * 旋转转盘
 * @param  {[type]} deg [description]
 * @return {[type]}     [description]
 */
function runRotate(deg) {
  // runInit();

  // setTimeout(function() {
  // addClass(container, 'gb-run');
    container.style[transform] = 'rotate(' + deg + 'deg)';
  // }, 10);
}

/**
 * 抽奖事件
 * @return {[type]} [description]
 */
function events() {
  fnGetPrize(function(oData) {
     if (oData[1]) {
      
      bind(btn, 'click', function(ev) {
        /*      var prizeId,
                chances;*/
        
            addClass(btn, 'disabled');
        
            fnGetPrize(function(data) {
              optsPrize = {
                prizeId: data[0],
                chances: data[1] - 1
              }
              // 计算旋转角度
              deg = deg || 0;
              deg = deg + (360 - deg % 360) + (360 * 10 - data[0] * (360 / num))
              runRotate(deg);
            });
        
            // 中奖提示
            bind(container, transitionEnd, eGot);
            ev.stopPropagation();
          });
       }
    });
}

function eGot(ev) {
  
    if (optsPrize.chances) removeClass(btn, 'disabled');  
    
    fnGotBack(prizes[optsPrize.prizeId]);
    ev.stopPropagation();
}


/**
 * Bind events to elements 
 * @param {Object}    ele    HTML Object
 * @param {Event}     event  Event to detach 
 * @param {Function}  fn     Callback function 
*/
function bind(ele, event, fn) {
    if (typeof addEventListener === 'function') {
        ele.addEventListener(event, fn, false);
        event.stopPropagation();
    } else if (ele.attachEvent) {
        ele.attachEvent('on' + event, fn);   
    }  
}

/**
 * Unbind events to elements
 * @param {Object}    ele    HTML Object
 * @param {Event}     event  Event to detach 
 * @param {Function}  fn     Callback function 
*/
/*  function unbind(ele, event, fn) {
    if (typeof removeEventListener === 'function') {
        ele.removeEventListener(event, fn, false);
    } else if (ele.detachEvent) {
        ele.detach('on' + event, fn);
    }
}*/

/**
 * hasClass
 * @param {Object} ele   HTML Object
 * @param {String} cls   className
 * @return {Boolean}
*/
function hasClass(ele, cls) {
  if (!ele || !cls) return false;
  if (ele.classList) {
    return ele.classList.contains(cls);  
  } else {
    return ele.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
  }
}

// addClass
function addClass(ele, cls) {
  if (ele.classList) {
    ele.classList.add(cls);
  } else {
    if (!hasClass(ele, cls)) ele.className += '' + cls; 
  }
}

// removeClass
function removeClass(ele, cls) {
  if (ele.classList) {
    ele.classList.remove(cls);
  } else {
    ele.className = ele.className.replace(new RegExp('(^|\\b)' + ele.className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
  }
}


export default {
    init: (opts) => {
      return init(opts);
    }
}

/*
// (@see https://github.com/madrobby/zepto/blob/master/src/zepto.js)
window.gbTurntable === undefined && (window.gbTurntable = gbTurntable);
  // AMD (@see https://github.com/jashkenas/underscore/blob/master/underscore.js)
  if (typeof define == 'function' && define.amd) {
    define('GB-canvas-turntable', [], function() {
      return gbTurntable;
    });
  }

}());
*/
