import QtQuick 2.3
import 'OwaNEXT/Component' 1.0

Item {
	id: desktops;

	IconArea {
		id: iconArea;
		anchors.fill: parent;

		Apps {
			paginable: true;
			count: 8;
			template: IconItem {
				width: iconArea.tileWidth;
				height: iconArea.tileHeight;
				keys: [ 'IconItem' ]

				onClicked: {
					owaNEXT.packageManager.startApp(app);
				}

				onPressAndHold: {
					appWindow.editing = true;

					// Start dragging
					mgr.drag.target = this;
					this.Drag.active = true;
				}

				onReleased: {
					appWindow.editing = false;

					// Stop dragging
					this.Drag.drop();
					mgr.drag.target = null;
				}
			}
		}
	}
}
