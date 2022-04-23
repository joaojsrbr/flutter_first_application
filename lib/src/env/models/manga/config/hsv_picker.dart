import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// Just an example of how to use/interpret/format text input's result.
void copyToClipboard(String input) {
  String textToCopy = input.replaceFirst('#', '').toUpperCase();
  if (textToCopy.startsWith('FF') && textToCopy.length == 8) {
    textToCopy = textToCopy.replaceFirst('FF', '');
  }
  Clipboard.setData(ClipboardData(text: '#$textToCopy'));
}

class HSVColorPickerExample extends StatefulWidget {
  const HSVColorPickerExample({
    Key? key,
    required this.pickerColor,
    required this.onColorChanged,
    this.colorHistory,
    this.onHistoryChanged,
  }) : super(key: key);

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;
  final List<Color>? colorHistory;
  final ValueChanged<List<Color>>? onHistoryChanged;

  @override
  State<HSVColorPickerExample> createState() => _HSVColorPickerExampleState();
}

class _HSVColorPickerExampleState extends State<HSVColorPickerExample> {
  // Picker 1
  PaletteType _paletteType = PaletteType.hsl;
  bool _enableAlpha = true;
  bool _displayThumbColor = true;
  final List<ColorLabelType> _labelTypes = [
    ColorLabelType.hsl,
    ColorLabelType.hsv
  ];
  bool _displayHexInputBar = false;

  // Picker 2
  bool _displayThumbColor2 = true;
  bool _enableAlpha2 = false;

  // Picker 3
  ColorModel _colorModel = ColorModel.rgb;
  bool _enableAlpha3 = false;
  bool _displayThumbColor3 = true;
  bool _showParams = true;
  bool _showIndicator = true;

  // Picker 4
  final textController = TextEditingController(
      text:
          '#2F19DB'); // The initial value can be provided directly to the controller.
  bool _enableAlpha4 = true;

  @override
  void dispose() {
    textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.all(0),
                      contentPadding: const EdgeInsets.all(0),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: widget.pickerColor,
                          onColorChanged: widget.onColorChanged,
                          colorPickerWidth: 300,
                          pickerAreaHeightPercent: 0.7,
                          enableAlpha: _enableAlpha,
                          labelTypes: _labelTypes,
                          displayThumbColor: _displayThumbColor,
                          paletteType: _paletteType,
                          pickerAreaBorderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                          ),
                          hexInputBar: _displayHexInputBar,
                          colorHistory: widget.colorHistory,
                          onHistoryChanged: widget.onHistoryChanged,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Color Picker with Slider',
                style: TextStyle(
                    color: useWhiteForeground(widget.pickerColor)
                        ? Colors.white
                        : Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: Text(
                          '''
          ColorPicker(
        pickerColor: color,
        onColorChanged: changeColor,
        colorPickerWidth: 300,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: $_enableAlpha,
        labelTypes: $_labelTypes,
        displayThumbColor: $_displayThumbColor,
        paletteType: $_paletteType,
        pickerAreaBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(2),
        topRight: Radius.circular(2),
        ),
        hexInputBar: $_displayHexInputBar,
        colorHistory: colorHistory,
        onHistoryChanged: changeColorHistory,
          )
                              ''',
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.code,
                  color: useWhiteForeground(widget.pickerColor)
                      ? Colors.white
                      : Colors.black),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        SwitchListTile(
          title: const Text('Enable Alpha Slider'),
          subtitle: const Text('Display alpha slider & label text'),
          value: _enableAlpha,
          activeColor: Theme.of(context).colorScheme.tertiary,
          onChanged: (bool value) =>
              setState(() => _enableAlpha = !_enableAlpha),
        ),
        SwitchListTile(
          title: const Text('Display Thumb Color in slider'),
          value: _displayThumbColor,
          activeColor: Theme.of(context).colorScheme.tertiary,
          onChanged: (bool value) =>
              setState(() => _displayThumbColor = !_displayThumbColor),
        ),
        ListTile(
          title: const Text('Palette Type'),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _paletteType,
              onChanged: (PaletteType? type) {
                if (type != null) setState(() => _paletteType = type);
              },
              items: [
                for (PaletteType type in PaletteType.values)
                  DropdownMenuItem(
                    value: type,
                    child: SizedBox(
                      width: 150,
                      child: Text(type.toString().split('.').last,
                          textAlign: TextAlign.end),
                    ),
                  )
              ],
            ),
          ),
        ),
        ExpansionTile(
          title:
              Text(_labelTypes.isNotEmpty ? 'Display Label' : 'Disable Label'),
          subtitle: Text(
            _labelTypes.isNotEmpty
                ? _labelTypes
                    .map((e) => e.toString().split('.').last.toUpperCase())
                    .toString()
                : '',
          ),
          children: [
            SwitchListTile(
              title: const Text('    Display HEX Label Text'),
              value: _labelTypes.contains(ColorLabelType.hex),
              activeColor: Theme.of(context).colorScheme.tertiary,
              onChanged: (bool value) => setState(
                () => value
                    ? _labelTypes.add(ColorLabelType.hex)
                    : _labelTypes.remove(ColorLabelType.hex),
              ),
              dense: true,
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: const Text('    Display RGB Label Text'),
              value: _labelTypes.contains(ColorLabelType.rgb),
              onChanged: (bool value) => setState(
                () => value
                    ? _labelTypes.add(ColorLabelType.rgb)
                    : _labelTypes.remove(ColorLabelType.rgb),
              ),
              dense: true,
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: const Text('    Display HSV Label Text'),
              value: _labelTypes.contains(ColorLabelType.hsv),
              onChanged: (bool value) => setState(
                () => value
                    ? _labelTypes.add(ColorLabelType.hsv)
                    : _labelTypes.remove(ColorLabelType.hsv),
              ),
              dense: true,
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: const Text('    Display HSL Label Text'),
              value: _labelTypes.contains(ColorLabelType.hsl),
              onChanged: (bool value) => setState(
                () => value
                    ? _labelTypes.add(ColorLabelType.hsl)
                    : _labelTypes.remove(ColorLabelType.hsl),
              ),
              dense: true,
            ),
          ],
        ),
        SwitchListTile(
          activeColor: Theme.of(context).colorScheme.tertiary,
          title: const Text('Display Hex Input Bar'),
          value: _displayHexInputBar,
          onChanged: (bool value) =>
              setState(() => _displayHexInputBar = !_displayHexInputBar),
        ),
      ],
    );
  }
}
