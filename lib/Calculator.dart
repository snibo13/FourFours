void _plus() {
  setState(() {
    _value += "+";
  });
}

void correctSound() {
  Flame.audio.play("correct.mp3");
}

void squared() {
  setState(() {
    _value += '\u00B2';
  });
}

void _factorial() {
  setState(() {
    _value += '!';
  });
}

void _exp() {
  setState(() {
    _value += "^";
  });
}

void _squared() {
  setState(() {
    _value += "²";
  });
}

void _minus() {
  setState(() {
    _value += "-";
  });
}

void _div() {
  setState(() {
    _value += "\u00F7";
  });
}

void _mult() {
  setState(() {
    _value += "x";
  });
}

void _sqrt() {
  setState(() {
    _value += '\u221a';
  });
}

void _openParen() {
  setState(() {
    _value += "(";
  });
}

void _closeParen() {
  setState(() {
    _value += ")";
  });
}

void _decimal() {
  setState(() {
    _value += ".";
  });
}

void _clear() {
  setState(() {
    _value = "";
    _counter = 4;
  });
}

void _addChar(String char) {
  setState(() {
    _value += char;
  });
}

void _equals() {
  setState(() {
    _computation = mathEngine(_value).round();
    if (_computation == _goal && _counter == 0) {
      _goal++;
      correctSound();
      _updateScore(_goal);
      _clear();
    } else {
      if (_counter != 0) {
        _value += "=$_computation";
      } else {
        _value += "=$_computation";
      }
    }
  });
}

void _four() {
  setState(() {
    if (!(_counter == 0)) {
      _value += "4";
      _counter--;
    }
  });
}

void _backspace() {
  setState(() {
    int len = _value.length;
    if (int.tryParse(_value.substring(len - 1)) != null) {
      _counter++;
    }
    _value = _value.substring(0, len - 1);
  });
}
