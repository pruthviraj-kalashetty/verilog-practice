import matplotlib.pyplot as plt
import matplotlib.patches as patches

# Set up figure
fig, ax = plt.subplots(figsize=(12, 4))
ax.set_xlim(0, 12)
ax.set_ylim(0, 4)
ax.axis('off')

# Title
ax.text(6, 3.6, "TRAFFIC LIGHT TIMING FLOW", fontsize=14, fontweight='bold', ha='center', color='#1e3a8a')

# States configuration
states = [
    {"name": "NS_GREEN", "timing": "50 ns", "desc": "NS = GREEN\nEW = RED", "color": "#22c55e"},
    {"name": "NS_YELLOW", "timing": "20 ns", "desc": "NS = YELLOW\nEW = RED", "color": "#eab308"},
    {"name": "ALL RED", "timing": "10 ns", "desc": "NS = RED\nEW = RED", "color": "#ef4444"},
    {"name": "EW_GREEN", "timing": "50 ns", "desc": "NS = RED\nEW = GREEN", "color": "#22c55e"},
    {"name": "EW_YELLOW", "timing": "20 ns", "desc": "NS = RED\nEW = YELLOW", "color": "#eab308"},
    {"name": "ALL RED", "timing": "10 ns", "desc": "NS = RED\nEW = RED", "color": "#ef4444"}
]

box_width = 1.6
box_height = 1.4
start_x = 0.5
y_pos = 1.5

for i, state in enumerate(states):
    x = start_x + i * 1.85
    
    # Timing label above
    ax.text(x + box_width/2, y_pos + box_height + 0.3, f"{state['timing']}", fontsize=10, fontweight='bold', ha='center', color='#475569')
    ax.text(x + box_width/2, y_pos + box_height + 0.1, "▼", fontsize=8, ha='center', color='#64748b')
    
    # Draw box
    rect = patches.FancyBboxPatch((x, y_pos), box_width, box_height, boxstyle="round,pad=0.1", facecolor='#f8fafc', edgecolor='#334155', linewidth=1.5)
    ax.add_patch(rect)
    
    # State name header inside box
    ax.text(x + box_width/2, y_pos + 0.95, state['name'], fontsize=9, fontweight='bold', ha='center', color='#0f172a')
    
    # Divider line
    ax.plot([x + 0.1, x + box_width - 0.1], [y_pos + 0.75, y_pos + 0.75], color='#cbd5e1', linewidth=1)
    
    # Description inside box
    ax.text(x + box_width/2, y_pos + 0.35, state['desc'], fontsize=8, ha='center', color='#334155', linespacing=1.3)
    
    # Arrow to next state
    if i < len(states) - 1:
        ax.annotate('', xy=(x + box_width + 0.25, y_pos + box_height/2), xytext=(x + box_width, y_pos + box_height/2),
                    arrowprops=dict(arrowstyle="->", color='#3b82f6', lw=1.5))

# Loop back arrow underneath
ax.annotate('', xy=(start_x + box_width/2, y_pos - 0.2), xytext=(start_x + 5 * 1.85 + box_width/2, y_pos - 0.2),
            arrowprops=dict(arrowstyle="->", color='#3b82f6', lw=1.5, connectionstyle="arc3,rad=0.3"))
ax.text(start_x + 2.5 * 1.85 + box_width/2, y_pos - 0.8, "Loop to NS_GREEN", fontsize=9, fontweight='bold', ha='center', color='#1d4ed8')

plt.tight_layout()
plt.savefig("traffic_light_timing_flow.png", dpi=300, bbox_inches='tight')
plt.savefig("traffic_light_timing_flow.jpg", dpi=300, bbox_inches='tight', facecolor='white')
print("Images generated successfully.")
