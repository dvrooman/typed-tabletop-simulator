---@meta

---@alias tts__ObjectType "3D Text" | "Backgammon Piece" | "Bag" | "Block" | "Board" | "Calculator" | "Card" | "Checker" | "Chess" | "Chip" | "Clock" | "Coin" | "Counter" | "Deck" | "Dice" | "Domino" | "Figurine" | "Fog" | "FogOfWar" | "GoPiece" | "Hand" | "Infinite" | "InventoryBackground" | "InventoryBotBG" | "InventoryItemBlank" | "InventoryTopBG" | "Mp3" | "Notecard" | "Jigsaw" | "Jigsaw Box" | "Pointer" | "Randomize" | "rpgFigurine" | "Scripting" | "Stack" | "Superfight" | "Surface" | "Tablet" | "Tile" | "Tileset" | "VR UI"

---@alias tts__JointType "Fixed" | "Hinge" | "Spring"

---@class tts__JointParameters
---@field type tts__JointType
---@field joint_object_guid nil | string
---@field collision nil | boolean
---@field break_force nil | number
---@field break_torgue nil | number
---@field axis nil | tts__VectorShape
---@field anchor nil | tts__VectorShape
---@field connected_anchor nil | tts__VectorShape

---@alias tts__FixedJointOptions tts__JointParameters

---@class tts__SpringJointOptions : tts__JointParameters
---@field spring nil | number @Default 10
---@field damper nil | number @Default 0.2

---@class tts__HingeJointOptions : tts__JointParameters
---@field motor_force nil | number
---@field motor_velocity nil | number
---@field motor_free_spin nil | boolean
---@field max_distance nil | number
---@field min_distance nil | number

---@class tts__Object : tts__GameObject
---@field angular_drag number
---@field AssetBundle tts__AssetBundle  @[Read only]
---@field auto_raise boolean
---@field bounciness number
---@field drag number
---@field drag_selectable boolean
---@field dynamic_friction number
---@field grid_projection boolean
---@field guid string @[Read only]
---@field held_by_color nil | tts__PlayerColor @[Read only]
---@field hide_when_face_down boolean
---@field ignore_fog_of_war boolean
---@field interactable boolean
---@field is_face_down boolean @[Read only]
---@field loading_custom boolean @[Read only]
---@field locked boolean
---@field mass number
---@field max_typed_number number
---@field memo nil | string
---@field name string @[Read only] Internal resource name for this Object. Typically only useful for spawnObjectData()/spawnObjectJSON(). Generally, you want getName() instead.
---@field pick_up_position tts__Vector @[Read only]
---@field pick_up_rotation tts__Vector @[Read only]
---@field remainder nil | tts__Object @[Read only]
---@field resting boolean
---@field script_code string
---@field script_state string
---@field spawning boolean
---@field static_friction number
---@field sticky boolean
---@field tag tts__ObjectType @Deprecated: Use type. An identifier indicating the type of Tabletop Simulator object. [Read only]
---@field type tts__ObjectType @An identifier indicating the type of Tabletop Simulator object. [Read only]
---@field tooltip boolean
---@field UI tts__UI @[Read only]
---@field use_gravity boolean
---@field use_grid boolean
---@field use_hands boolean @Whether or not this object may be held within a hand zone.
---@field use_rotation_value_flip boolean
---@field use_snap_points boolean
---@field value number
---@field value_flags number
local Object

---@class tts__Book : tts__Object
---@field Book tts__BookBehaviour

--- The following are not real types in TTS, but this allows us to strongly type our code where an object of a specific type is required.
--- NOTE: There is no tts__AssetBundle or tts__Model, because these objects always masquerade as another object type.


---@class tts__Container : tts__Object
---@field Container tts__ContainerBehaviour
local Container

---@class tts__Stackable : tts__Object
local Stackable

---@class tts__BackgammonPiece : tts__Object

---@class tts__Bag : tts__Container

---@class tts__Block : tts__Object

---@class tts__Board : tts__Object

---@class tts__Calculator : tts__Object

---@class tts__Card : tts__Object
local Card

---@class tts__CardCustom : tts__Card
local CardCustom

---@class tts__Checker : tts__Stackable

---@class tts__Chess : tts__Object

---@class tts__Chip : tts__Stackable

---@class tts__Clock : tts__Object

---@class tts__Coin : tts__Object

---@class tts__Counter : tts__Object

---@class tts__Deck : tts__Container

---@class tts__DeckCustom : tts__Deck
local DeckCustom

---@class tts__Die : tts__Object

---@class tts__DieCustom : tts__Die
local DieCustom

---@class Hand : tts__Object
local Hand

---@return tts__PlayerHandColor
function Hand.getValue() end

---@param newValue tts__PlayerHandColor
---@return boolean
function Hand.setValue(newValue) end

---@class tts__Domino : tts__Object

---@class tts__Figurine : tts__Object

---@class tts__Fog : tts__Object

---@class tts__FogOfWar : tts__Object

---@class tts__GoPiece : tts__Object

---@class tts__Hand : tts__Object

---@class tts__Infinite : tts__Object

---@class tts__InventoryBackground : tts__Object

---@class tts__InventoryBotBG : tts__Object

---@class tts__InventoryItemBlank : tts__Object

---@class tts__InventoryTopBG : tts__Object

---@class tts__MP3 : tts__Object

---@class tts__Notecard : tts__Object

---@class tts__Jigsaw : tts__Object

---@class tts__JigsawBox : tts__Object

---@class tts__Pointer : tts__Object

---@class tts__Randomize : tts__Object

---@class tts__RPGFigurine : tts__Object

---@class tts__ScriptingTrigger : tts__Object
local ScriptingTrigger

---@class tts__Superfight : tts__Object

---@class tts__Surface : tts__Object

---@class tts__Tablet : tts__Object

---@class tts__Text : tts__Object

---@class tts__Tile : tts__Stackable
local Tile

---@class tts__Tileset : tts__Object

---@class tts__Token : tts__Stackable
local Token

---@class tts__VRUI : tts__Object


---@alias tts__Object_DealDestination tts__PlayerHandColor | "All" | "Seated"

---@param object tts__Object
---@return boolean
function Object.addAttachment(object) end

---@param label string @Text for the menu item.
---@param callback fun(playerColor: tts__PlayerHandColor): void
---@param keepOpen? boolean @Whether the context menu should remain open after the item is selected. Defaults to false.
---@return true @Technically, returns false if your `callback` param is nil. However, Luanalysis won't allow you to make that mistake.
function Object.addContextMenuItem(label, callback, keepOpen) end

---@param functionName string
---@param functionParameters? table | number | string | boolean
---@return any ...
function Object.call(functionName, functionParameters) end

---@return true
function Object.clearContextMenu() end

---@class tts__ButtonParameters
---@field click_function nil | string @A String of the function's name that will be run when button is clicked.
---@field function_owner nil | string | tts__Self | tts__Object @The Object which contains the click_function function. Defaults to Global>
---@field label nil | string | number @Text that appears on the button. Defaults to ''.
---@field position nil | tts__VectorShape @Where the button appears, relative to the Object's center.
---@field rotation nil | tts__VectorShape @How the button is rotated, relative to the Object's rotation. Defaults to {x=0, y=0, z=0}.
---@field scale nil | tts__VectorShape @Scale of the button, relative to the Object's scale. Defaults to {x=1, y=1, z=1}.
---@field width nil | number @How wide the button will be, relative to the Object. Defaults to 100.
---@field height nil | number @How tall the button will be, relative to the Object. Defaults to 100.
---@field font_size nil | number @Size the label font will be, relative to the Object. Defaults to 100.
---@field color nil | tts__ColorShape @A Color for the clickable button. Defaults to {r=1, g=1, b=1}.
---@field font_color nil | tts__ColorShape @A Color for the label text.  Defaults to {r=0, g=0, b=0}.
---@field hover_color nil | tts__ColorShape @A Color for the background during mouse-over.
---@field press_color nil | tts__ColorShape @A Color for the background when clicked.
---@field tooltip nil | string @Popup of text, similar to how an Object's name is displayed on mouseover.  Defaults to ''.

---@class tts__InputParameters
---@field input_function nil | string @The function's name that will be run when the input is selected.
---@field function_owner nil | string | tts__Self @The Object which contains the input_function function.
---@field label nil | string @Text that appears as greyed out text when there is no value in the input.
---@field position nil | tts__VectorShape @Where the input appears, relative to the Object's center.
---@field rotation nil | tts__VectorShape @How the input is rotated, relative to the Object's rotation.
---@field scale nil | tts__VectorShape @Scale of the input, relative to the Object's scale.
---@field width nil | number @How wide the input will be, relative to the Object.
---@field height nil | number @How tall the input will be, relative to the Object.
---@field font_size nil | number @Size the label/value font will be, relative to the Object.
---@field color nil | tts__ColorShape @A Color for the input's background.
---@field font_color nil | tts__ColorShape @A Color for the value text.
---@field tooltip nil | string @A popup of text, similar to how an Object's name is displayed on mouseover.
---@field alignment nil | tts__Input_Alignment @How text is aligned in the input box.
---@field value nil | string | number @A String of the text entered into the input.
---@field validation nil | tts__Input_Validation @An Int which determines what characters can be input into the value.
---@field tab nil | tts__Input_Tab @An Int which determines how pressing tab is handled when inputting.

--- Automatic | Left | Center | Right | Justified
---@alias tts__Input_Alignment 1 | 2 | 3 | 4 | 5

--- None | Integer | Float | Alphanumeric | Username | Name
---@alias tts__Input_Validation 1 | 2 | 3 | 4 | 5 | 6

--- None | Select Next Input | Indent
---@alias tts__Input_Tab 1 | 2 | 3

---@class tts__EditInputParameters : tts__InputParameters
---@field index number

---
--- Removes all buttons from the object.
---
---@return true
function Object.clearButtons() end

---@class tts__CreateButtonParameters : tts__ButtonParameters
---@field click_function string @A String of the function's name that will be run when button is clicked.

---
--- Creates a new button on the object.
---
--- Returns false if you provide invalid parameters (e.g. blank `click_function` string), otherwise true.
---
---@param parameters tts__CreateButtonParameters
---@return boolean
function Object.createButton(parameters) end

---@class tts__CloneParameters
---@field position nil | tts__VectorShape
---@field snap_to_grid nil | boolean

---@param parameters tts__CloneParameters
---@return tts__Object
function Object.clone(parameters) end

---
--- If the object is a bag, deck or stack, deals an object from within to the specified player hand.
---
---@param count number
---@param destination? tts__Object_DealDestination @Default "Seated"
---@param handIndex? number @Default 1
---@return true
function Object.deal(count, destination, handIndex) end

--- Destroys an attachment with the given index.
---@param index number
---@return boolean
function Object.destroyAttachment(index) end

--- Destroys all attachments.
---@return boolean
function Object.destroyAttachments() end

---
--- Destroys the underlying Tabletop Simulator object.
---
---@return boolean
function Object.destruct() end

---@class tts__EditButtonParameters : tts__ButtonParameters
---@field index number

---
--- Edits an existing button, referred to by the button's 0-based index (order of creation, starting at zero).
---
--- Returns false if you provide invalid parameters (e.g. blank `click_function` string), otherwise true.
---
---@param parameters tts__EditButtonParameters
---@return boolean
function Object.editButton(parameters) end

--- Modify an existing input. The only parameter that is required is the index. The rest are optional, and not using them will cause the edited input's element to remain.
---
--- Indexes start at 0. The first input on any given Object has an index of 0, the next input on it has an index of 1, etc. Each Object has its own indexes.
---@param parameters tts__EditInputParameters
---@return boolean
function Object.editInput(parameters) end

---@return boolean
function Object.flip() end

---
--- Returns the object's angular velocity, in radians per second.
---@return tts__Vector
function Object.getAngularVelocity() end

---@return tts__IndexedSimpleObjectState[]
function Object.getAttachments() end

---@class tts__Bounds
---@field center tts__Vector
---@field size tts__Vector
---@field offset tts__Vector

---
--- Returns an axis aligned bounding box encompassing the object. Position is in global coordinates, however the size of bounds takes into account the
--- underlying object model scale, which is not exposed directly to Lua.
---
--- As any (non-spherical) object rotates, these bounds change size to encompass the object's current orientation.
---@return tts__Bounds
---@see tts__Object#getBoundsNormalized
function Object.getBounds() end

---
--- Returns the object's bounds, in global coordinates, as if the object were rotated to {0, 0, 0}.
---
--- The size of these bounds remain unchanged under rotation. However, changes in the object's position are reflected in the bound's center position.
---@return tts__Bounds
function Object.getBoundsNormalized() end

---@class tts__Button
---@field click_function string @Name of a global function that will be executed when the button is clicked.
---@field function_owner string @The Object where click_function is defined.
---@field label string @Text that appears on the button.
---@field position tts__Vector @Where the button appears, relative to the Object's center.
---@field rotation tts__Vector @How the button is rotated, relative to the Object's rotation.
---@field scale tts__Vector @Scale of the button, relative to the Object's scale.
---@field width number @How wide the button is relative to the Object.
---@field height number @How tall the button is relative to the Object.
---@field font_size number @Size of the label font, relative to the Object.
---@field color tts__Color @The Color of the button background.
---@field font_color tts__Color @The Color of the label text.
---@field hover_color tts__Color @The Color of the background during mouse-over.
---@field press_color tts__Color @The Color of the background when clicked.
---@field tooltip string @Pop-up description displayed on hover.
---@field index number

---@return tts__Button[]
function Object.getButtons() end

---@class tts__Object_ImageCustomObject
---@field image string
---@field image_bottom string @Same value as image_secondary
---@field image_secondary string
---@field image_scalar number

--- Plastic | Wood | Metal | Cardboard | Glass
---@alias tts__MaterialType 0 | 1 | 2 | 3 | 4

--- Generic | Coin | Bag | Figurine | Board | Infinite | Dice
---@alias tts__AssetBundleType 0 | 1 | 2 | 3 | 4 | 5 | 6

---@class tts__Object_AssetBundleCustomObject
---@field assetbundle string
---@field assetbundle_secondary string
---@field type tts__AssetBundleType
---@field material tts__MaterialType

---@class tts__Object_CardCustomObject
---@field face string
---@field unique_back boolean
---@field back string
---@field width number
---@field height number
---@field sideways boolean
---@field back_is_hidden boolean
---@field type tts__CardType

---@class tts__Object_DeckCustomObject_CustomDeck
---@field face string
---@field unique_back boolean
---@field back string
---@field width number
---@field height number
---@field number number
---@field sideways boolean
---@field back_is_hidden boolean
---@field type tts__CardType

---@alias tts__Object_DeckCustomObject table<string, tts__Object_DeckCustomObject_CustomDeck>

---@class tts__Object_DieCustomObject : tts__Object_ImageCustomObject
---@field type tts__DieType

--- Generic | Figurine | Dice | Coin | Board | Chip | Bag | Infinite
---@alias tts__ModelType 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7

---@class tts__Object_ModelCustomObject
---@field mesh string
---@field diffuse string
---@field normal string
---@field collider string
---@field convex boolean
---@field type_index tts__ModelType
---@field material tts__MaterialType
---@field cast_shadows boolean
---@field specular_intensity number
---@field specular_color number
---@field specular_sharpness tts__Color
---@field fresnel_strength number

---@class tts__Object_TileCustomObject : tts__Object_ImageCustomObject
---@field type tts__TileType
---@field thickness number
---@field stackable boolean

---@class tts__Object_TokenCustomObject : tts__Object_ImageCustomObject
---@field thickness number
---@field merge_distance number
---@field stand_up boolean
---@field stackable boolean

---@alias tts__Object_CustomObject tts__Object_AssetBundleCustomObject | tts__Object_CardCustomObject | tts__Object_DeckCustomObject | tts__Object_DieCustomObject | tts__Object_ModelCustomObject | tts__Object_TileCustomObject | tts__Object_TokenCustomObject



---@return {} | tts__Object_CustomObject
function Object.getCustomObject() end

---@return tts__Object_CardCustomObject
function CardCustom.getCustomObject() end

---@return tts__Object_DeckCustomObject
function DeckCustom.getCustomObject() end

---@return tts__Object_DieCustomObject
function DieCustom.getCustomObject() end

---@return tts__Object_TileCustomObject
function Tile.getCustomObject() end

---@return tts__Object_TokenCustomObject
function Token.getCustomObject() end

--- Returns object's data (serialized saved state).
---@return tts__ObjectState
function Object.getData() end

--- Returns object's data (serialized saved state).
---@return tts__ContainerState
function Container.getData() end

---@class tts__Object_Decal
---@field name string
---@field url string
---@field position tts__Vector
---@field rotation tts__Vector
---@field scale tts__Vector

---
--- Returns an array of decals, or nil if there are no decals on the object.
---
---@return nil | tts__Object_Decal[]
function Object.getDecals() end

---@return string @Description, also shows as part of Object's tooltip.
function Object.getDescription() end

---
--- Object's unique identifier.
---@return string
function Object.getGUID() end

--- Game Master Notes only visible for Player Color Black.
---@return string
function Object.getGMNotes() end

---@return nil | tts__Color
function Object.getHighlightColor() end

---@class tts__Input
---@field input_function string @The function's name that will be run when the input is selected.
---@field function_owner string | tts__Self @The Object which contains the input_function function.
---@field label string @Text that appears as greyed out text when there is no value in the input.
---@field position tts__VectorShape @Where the input appears, relative to the Object's center.
---@field rotation tts__VectorShape @How the input is rotated, relative to the Object's rotation.
---@field scale tts__VectorShape @Scale of the input, relative to the Object's scale.
---@field width number @How wide the input will be, relative to the Object.
---@field height number @How tall the input will be, relative to the Object.
---@field font_size number @Size the label/value font will be, relative to the Object.
---@field color tts__ColorShape @A Color for the input's background.
---@field font_color tts__ColorShape @A Color for the value text.
---@field tooltip string @A popup of text, similar to how an Object's name is displayed on mouseover.
---@field alignment tts__Input_Alignment @How text is aligned in the input box.
---@field value string @A String of the text entered into the input.
---@field validation tts__Input_Validation @An Int which determines what characters can be input into the value.
---@field tab tts__Input_Tab @An Int which determines how pressing tab is handled when inputting.

---@return tts__Input[]
function Object.getInputs() end

---
--- Returns object's data (saved state) serialized into a JSON encoded string.
---@return string
function Object.getJSON() end

--- Returns whether or not the object is locked/frozen in place.
---@return boolean
function Object.getLock() end

---@return nil | string
function Object.getMemo() end

---
--- Returns object's name, as depicted in the object's tooltip.
---@return string
function Object.getName() end

---@class tts__SimpleObjectState
---@field name string
---@field nickname nil | string
---@field description nil | string
---@field gm_notes nil | string
---@field guid string
---@field lua_script nil | string
---@field lua_script_state nil | string
---@field memo nil | string
---@field tags string[]

---@class tts__IndexedSimpleObjectState : tts__SimpleObjectState
---@field index number

--- If this object is a scripting trigger, bag or deck, returns the objects contained within. Otherwise, logs an error and returns nil
---@return nil | tts__Object[] | tts__IndexedSimpleObjectState[]
function Object.getObjects() end

--- If this object is a scripting trigger, bag or deck, returns the objects contained within. Otherwise, logs an error and returns nil
---@return tts__IndexedSimpleObjectState[]
function Container.getObjects() end

--- If this object is a scripting trigger, bag or deck, returns the objects contained within. Otherwise, logs an error and returns nil
--- If the zone has tags, then only objects with compatible tags will occupy the zone (unless `ignoreTags` is `true`).
---@param ignoreTags? boolean If `true` then all objects in the zone will be returned, regardless of tags.
---@return tts__Object[]
function ScriptingTrigger.getObjects(ignoreTags) end

--- Combines 2 combinable objects to form a new container (Deck, Stat, etc)
---
---@param object tts__Object
---@return self
function Object.putObject(object) end

--- Places an object into a container.
---
---@param object tts__Object
---@return self
function Container.putObject(object) end

--- Places an chip onto another chip, forming a stack.
---
---@param object tts__Stackable
---@return self
function Stackable.putObject(object) end

--- Places an card onto another card, forming a deck.
---
---@param object tts__Card | tts__Deck
---@return tts__Deck
function Card.putObject(object) end

---@param index number
---@return tts__Object
function Object.removeAttachment(index) end

function Object.removeAttachments() end

---
--- Returns the object's position.
---@return tts__Vector
function Object.getPosition() end

---
--- Returns the object's rotation represented as a Vector of Euler angles.
---@return tts__Vector
function Object.getRotation() end

---
--- Returns the object's rotation value identifier. Often a number, but may also be a string.
---
--- At the time of writing, the only non-custom die that has string rotation values is Die_Piecepack, which has values
--- "Blank" and "Symbol" in place of the numbers 1 and 6 respectively (on a D6).
---
---@return number | string
function Object.getRotationValue() end

---@class tts__Object_RotationValue
---@field value number | string
---@field rotation tts__CharVectorShape

---
--- Returns the object's rotation values.
---
---@return tts__Object_RotationValue[]
function Object.getRotationValues() end

---
--- Returns the object's scale.
---@return tts__Vector
function Object.getScale() end

---@class tts__Object_SnapPoint
---@field position tts__Vector Position of the snap point. The position is relative to the object's center (a local position).
---@field rotation tts__Vector Rotation of the snap point. The rotation is relative to the object's rotation (a local rotation).
---@field rotation_snap boolean If the snap point is a "rotation" snap point.
---@field tags string[] The list of tags added to this snap point.

--- Returns an array of snap points.
---@return tts__Object_SnapPoint[]
function Object.getSnapPoints() end

---@return number
function Object.getStateId() end

---@return nil | tts__SimpleObjectState[]
function Object.getStates() end

---@param name string @Data value of a variable in another Object's script. Can only return a table.
---@return table
function Object.getTable(name) end

---
--- If the object is a bag, deck or stack, returns the number of objects within, otherwise -1.
---@return number
function Object.getQuantity() end

---@return any
function Object.getValue() end

---@param name string
---@return any
function Object.getVar(name) end

---@class tts__Object_VectorLine
---@field points tts__Vector[] @An array of 2 or more points representing a series of line segments from one point to the next.
---@field color tts__Color @The color of the line.
---@field rotation tts__Vector @Rotation of vector line. The rotation is relative to the object's rotation (a local rotation).
---@field thickness number @The thickness of the line.

--- Returns an array of vector lines.
---@return tts__Object_VectorLine[]
function Object.getVectorLines() end

---
--- Returns the object's velocity.
---@return tts__Vector
function Object.getVelocity() end

---@return tts__ScriptingTrigger[]
function Object.getZones() end

---@param color? tts__ColorShape|string
---@return true
function Object.highlightOff(color) end

---@param color tts__ColorShape|string
---@param duration? number
---@return true
function Object.highlightOn(color, duration) end

---Returns true if the Object is (or will be) destroyed.
---@return boolean
function Object.isDestroyed() end

---Returns if the object is presently smooth moving, false, otherwise.
---@return boolean
function Object.isSmoothMoving() end

---
--- When called with arguments, creates a joint between this object and another object.
---
--- When called without any arguments, removes all joints on this object.
---
---@param object? tts__Object
---@param parameters? tts__JointParameters
---@return boolean
function Object.jointTo(object, parameters) end

function Object.lock() end

---@return tts__Object
function Object.reload() end

--- Randomizes the object i.e. rolls a die, shuffles a deck, reorders a bag, or in the case of objects consisting of multiple states, randomly selects a state.
---@param playerColor? tts__PlayerColor
---@return boolean
function Object.randomize(playerColor) end

---@param index number @button index for this object, starting at 0
---@return boolean
function Object.removeButton(index) end

---
--- Scales the object by the specified multiplier(s), relative to the object's existing scale.
---
---@param scale? number
---@return true
function Object.scale(scale) end

---@class tts__Object_DecalParameters
---@field name string
---@field url string
---@field position nil | tts__VectorShape @Default Vector(0, 0, 0)
---@field rotation nil | tts__VectorShape @Default Vector(0, 0, 0)
---@field scale nil | tts__VectorShape @Default Vector(1, 1, 1)

---@param color tts__ColorShape
---@return boolean
function Object.setColorTint(color) end

---@class tts__Object_DeckCustomObject_CustomDeck_In
---@field face string
---@field back string
---@field unique_back nil | boolean @Defaults to false
---@field width nil | number @Defaults to 10
---@field height nil | number @Defaults to 7
---@field number nil | number @Defaults to 52
---@field sideways nil | boolean @Defaults to false
---@field back_is_hidden nil | boolean @Defaults to false
---@field type nil | tts__CardType @Defaults to 0

---@alias tts__Object_CustomObject_In tts__Object_DeckCustomObject_CustomDeck_In | tts__Object_CustomObject

---@param parameters tts__Object_CustomObject_In
function Object.setCustomObject(parameters) end

---
--- Removes all existing decals, replacing them with a decal per entry in the provided decal parameters array.
---
--- Returns false if the provided decal parameters are invalid (e.g. blank string name or URL), otherwise true.
---
---@param decals tts__Object_DecalParameters[]
---@return boolean
function Object.setDecals(decals) end

---@param description string
---@return true
function Object.setDescription(description) end

---@param notes string
function Object.setGMNotes(notes) end

---@param colors tts__PlayerColor[]
---@return boolean
function Object.setInvisibleTo(colors) end

---@param script string
function Object.setLuaScript(script) end

---
--- Sets whether the object is locked/frozen in place.
---
---@param lock boolean
---@return true
function Object.setLock(lock) end

---@param name string
---@return true
function Object.setName(name) end

---
--- Sets the object's position.
---
---@param position tts__VectorShape
---@return true
function Object.setPosition(position) end

---
--- Smoothly moves the object to the specified position.
---
---@param position tts__VectorShape
---@param collide? boolean @Whether collision detection is enabled. Default false.
---@param fast? boolean @Whether object should move quickly. Default false.
---@return true
function Object.setPositionSmooth(position, collide, fast) end

---@param scale tts__VectorShape
---@return true
function Object.setScale(scale) end

---@class tts__Object_SnapPointParameters
---@field position nil | tts__VectorShape Position of the snap point. The position is relative to the object's center (a local position). Default {0, 0, 0}
---@field rotation nil | tts__VectorShape Rotation of the snap point. The rotation is relative to the object's rotation (a local rotation). Default {0, 0, 0}
---@field rotation_snap nil | boolean If the snap point is a "rotation" snap point. Default false
---@field tags nil | string[] The list of tags for this snap point.

--- Removes all existing snap points, replacing them with a snap point per entry in the provided snap point parameters array.
---@param snapPoints tts__Object_SnapPointParameters[]
---@return true
---@see tts__Object#getSnapPoints
function Object.setSnapPoints(snapPoints) end

---@param state number
---@return tts__Object
function Object.setState(state) end

---@param name string @Name of the table.
---@param tab table
function Object.setTable(name, tab) end

---@class tts__Object_Decal_Add
---@field name string
---@field url string
---@field position tts__VectorShape
---@field rotation? tts__VectorShape
---@field scale? tts__VectorShape

---@param decal tts__Object_Decal_Add
function Object.addDecal(decal) end

---@alias tts__Object_Tag string

---@param tag tts__Object_Tag
---@return boolean
function Object.addTag(tag) end

--- Replaces all tags on the object with those contained in the specified table
---@param tags tts__Object_Tag[]
function Object.setTags(tags) end

---@param tag tts__Object_Tag
---@return boolean
function Object.removeTag(tag) end

---@return tts__Object_Tag[]
function Object.getTags() end

---@return boolean
function Object.hasAnyTag() end

---@param other tts__Object
---@return boolean
function Object.hasMatchingTag(other) end

---@param tag tts__Object_Tag
---@return boolean
function Object.hasTag(tag) end

---
--- Sets the object's rotation to the specified orientation, provided as a vector of Euler angles.
---
---@param rotation tts__VectorShape
---@return true
function Object.setRotation(rotation) end

---
--- Smoothly rotates the object to the specified orientation, provided as a vector of Euler angles.
---
---@param rotation tts__VectorShape
---@param collide? boolean @Whether collision detection is enabled. Default false.
---@param fast? boolean @Whether object should rotate quickly. Default false.
---@return true
function Object.setRotationSmooth(rotation, collide, fast) end

---
--- Smoothly sets the object's rotation to the rotation corresponding with the provided rotation value identifier.
---
--- Must be a string/number corresponding with an existing rotation value identifier.
---
---@param value number | string
---@return true
---@see tts__Object#getRotationValues
function Object.setRotationValue(value) end

---@param newValue string
---@return any
function Object.setValue(newValue) end

---@param name string
---@param value any
---@return true
function Object.setVar(name, value) end

---@class tts__Object_VectorLineParameters
---@field points tts__VectorShape[] @An array of 2 or more points representing a series of line segments from one point to the next.
---@field color nil | tts__ColorShape @The color of the line. Default {1, 1, 1}
---@field rotation nil | tts__VectorShape @Rotation of vector line. The rotation is relative to the object's rotation (a local rotation). Default {0, 0, 0}
---@field thickness nil | number @The thickness of the line. Default 0.1

--- Removes all existing vector lines, replacing them with a new vector line per entry in the provided vector line parameters array.
---@param lines tts__Object_VectorLineParameters[]
---@return true
---@see tts__Object#getVectorLines
function Object.setVectorLines(lines) end

---@return boolean
function Object.shuffle() end

function Object.unlock() end

---
--- Returns a local coordinate position corresponding with world coordinate position.
---
---@param position tts__VectorShape
---@return tts__Vector
function Object.positionToLocal(position) end

---
--- Returns a world coordinate position corresponding with local coordinate position.
---
---@param position tts__VectorShape
---@return tts__Vector
function Object.positionToWorld(position) end

---@class tts__Object_TakeObjectParameters : tts__ObjectCallback
---@field top nil | boolean
---@field smooth nil | boolean
---@field position nil | tts__VectorShape
---@field rotation nil | tts__VectorShape
---@field flip nil | boolean

---@class tts__Object_GuidTakeObjectParameters : tts__Object_TakeObjectParameters
---@field guid nil | string

---@class tts__Object_IndexTakeObjectParameters : tts__Object_TakeObjectParameters
---@field index nil | number


---
--- Registers this object for Global collision events, such as onObjectCollisionEnter. Always returns true.
---
---@param stay? boolean @Default false. Whether we should register for onObjectCollisionStay. Stay events may negatively impact performance, only set this to true if absolutely necessary.
---@return true
function Object.registerCollisions(stay) end

---
--- If this object is a deck or bag, takes on object out.
---
--- Although an object reference is returned, it will not have spawned within the scene and thus is generally not safe
--- to use until callback_function been called.
---
---@param params? tts__Object_GuidTakeObjectParameters | tts__Object_IndexTakeObjectParameters
---@return nil | tts__Object
function Object.takeObject(params) end

---
--- Deregisters this object for Global collision events. Returns true if the object was previously registered, false otherwise.
---
---@return boolean
function Object.unregisterCollisions() end

---@class tts__ObjectCallback
---@field callback_function nil | tts__ObjectCallbackFunction
---@field params nil | table @Deprecated - use callback_function

---@alias tts__ObjectCallbackFunction fun(object: tts__Object): void

---@class tts__SpawnObjectParams : tts__ObjectCallback
---@field type string
---@field position nil | tts__VectorShape @Default Vector(0, 0, 0)
---@field rotation nil | tts__VectorShape @Default Vector(0, 0, 0)
---@field scale nil | tts__VectorShape @Default Vector(1, 1, 1)
---@field sound nil | boolean @Default true
---@field snap_to_grid nil | boolean

---@class tts__SpawnObjectSerializedParams : tts__ObjectCallback
---@field position nil | tts__VectorShape
---@field rotation nil | tts__VectorShape
---@field scale nil | tts__VectorShape

---@class tts__SpawnObjectDataParams : tts__SpawnObjectSerializedParams
---@field data tts__ObjectState

---@class tts__SpawnObjectJSONParams : tts__SpawnObjectSerializedParams
---@field json string

---@param params tts__SpawnObjectParams
---@return tts__Object
function spawnObject(params)
end

---@param params tts__SpawnObjectDataParams
---@return tts__Object
function spawnObjectData(params)
end

---@param params tts__SpawnObjectJSONParams
---@return tts__Object
function spawnObjectJSON(params)
end

---@param guid string
---@return nil | tts__Object
function getObjectFromGUID(guid)
end

---@return tts__Object[]
function getAllObjects()
end

---@return tts__Object[]
function getObjects()
end

---@param tag string
---@return tts__Object[]
function getObjectsWithTag(tag)
end

---@param tags string[]
---@return tts__Object[]
function getObjectsWithAllTags(tags)
end

---@class tts__Global : tts__Object
Global = {}

---@class tts__Self : tts__Object
self = {}
