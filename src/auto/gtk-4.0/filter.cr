require "../g_object-2.0/object"

module Gtk
  # A `GtkFilter` object describes the filtering to be performed by a
  # `GtkFilterListModel`.
  #
  # The model will use the filter to determine if it should include items
  # or not by calling [method@Gtk.Filter.match] for each item and only
  # keeping the ones that the function returns %TRUE for.
  #
  # Filters may change what items they match through their lifetime. In that
  # case, they will emit the [signal@Gtk.Filter::changed] signal to notify
  # that previous filter results are no longer valid and that items should
  # be checked again via [method@Gtk.Filter.match].
  #
  # GTK provides various pre-made filter implementations for common filtering
  # operations. These filters often include properties that can be linked to
  # various widgets to easily allow searches.
  #
  # However, in particular for large lists or complex search methods, it is
  # also possible to subclass `GtkFilter` and provide one's own filter.
  class Filter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_filter_get_type
    end

    def changed(change : Gtk::FilterChange) : Nil
      # gtk_filter_changed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_filter_changed(self, change)

      # Return value handling
    end

    def strictness : Gtk::FilterMatch
      # gtk_filter_get_strictness: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_filter_get_strictness(self)

      # Return value handling
      Gtk::FilterMatch.from_value(_retval)
    end

    def match(item : GObject::Object) : Bool
      # gtk_filter_match: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_filter_match(self, item)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Gtk::FilterChange, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::FilterChange, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::FilterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::FilterChange.from_value(lib_arg0)
          ::Box(Proc(Gtk::FilterChange, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::FilterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::FilterChange.from_value(lib_arg0)
          ::Box(Proc(Gtk::FilterChange, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Filter, Gtk::FilterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Filter.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::FilterChange.from_value(lib_arg0)
          ::Box(Proc(Gtk::Filter, Gtk::FilterChange, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Filter, Gtk::FilterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Filter.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::FilterChange.from_value(lib_arg0)
          ::Box(Proc(Gtk::Filter, Gtk::FilterChange, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(change : Gtk::FilterChange) : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed", change)
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
