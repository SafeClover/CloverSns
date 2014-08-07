package cloverSns.clover.cloversnsapp;

import android.app.ListActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.animation.ScaleAnimation;
import android.view.animation.Transformation;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;

import com.example.cloversns.R;

public class CustomServices extends ListActivity implements OnClickListener {
	public OnLongClickListener longClickListner;
	LinearLayout loginPanel1, loginPanel2, loginPanel3, loginPanel4, loginPanel5, 
				 pwPanel1, pwPanel2, startPanel1, startPanel2, startPanel3;
	TextView loginText1, loginText2, loginText3, loginText4, loginText5, pwText1, pwText2, startText1, startText2, startText3;
	View openLayout;
	

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.custom_service);
		//회원가입 및 로그인
		loginPanel1 = (LinearLayout) findViewById(R.id.loginPanel1);
		loginPanel2 = (LinearLayout) findViewById(R.id.loginPanel2);
		loginPanel3 = (LinearLayout) findViewById(R.id.loginPanel3);
		loginPanel4 = (LinearLayout) findViewById(R.id.loginPanel4);
		loginPanel5 = (LinearLayout) findViewById(R.id.loginPanel5);
		//비밀번호
		pwPanel1 = (LinearLayout) findViewById(R.id.pwPanel1);
		pwPanel2 = (LinearLayout) findViewById(R.id.pwPanel2);
		//클로버 시작
		startPanel1 = (LinearLayout) findViewById(R.id.startPanel1);
		startPanel2 = (LinearLayout) findViewById(R.id.startPanel2);
		startPanel3 = (LinearLayout) findViewById(R.id.startPanel3);

		// panel1.setVisibility(View.VISIBLE);

		// panel1.setVisibility(View.VISIBLE);

		// Log.v("CZ","height at first ..." + panel1.getMeasuredHeight());
		
		//회원가입 및 로그인
		loginText1 = (TextView) findViewById(R.id.loginText1);
		loginText2 = (TextView) findViewById(R.id.loginText2);
		loginText3 = (TextView) findViewById(R.id.loginText3);
		loginText4 = (TextView) findViewById(R.id.loginText4);
		loginText5 = (TextView) findViewById(R.id.loginText5);
		//비밀번호
		pwText1 = (TextView) findViewById(R.id.pwText1);
		pwText2 = (TextView) findViewById(R.id.pwText2);
		//클로버 시작
		startText1 = (TextView) findViewById(R.id.startText1);
		startText2 = (TextView) findViewById(R.id.startText2);
		startText3 = (TextView) findViewById(R.id.startText3);

		//회원가입 및 로그인
		loginText1.setOnClickListener(this);
		loginText2.setOnClickListener(this);
		loginText3.setOnClickListener(this);
		loginText4.setOnClickListener(this);
		loginText5.setOnClickListener(this);
		
		//비밀번호
		pwText1.setOnClickListener(this);
		pwText2.setOnClickListener(this);
		
		//클로버 시작
		startText1.setOnClickListener(this);
		startText2.setOnClickListener(this);
		startText3.setOnClickListener(this);
	}

	@Override
	public void onClick(View v) {
		hideOthers(v);
	}

	private void hideThemAll() {
		if (openLayout == null)
			return;
		if (openLayout == loginPanel1)
			loginPanel1.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, loginPanel1, true));
		if (openLayout == loginPanel2)
			loginPanel2.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, loginPanel2, true));
		if (openLayout == loginPanel3)
			loginPanel3.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, loginPanel3, true));
		if (openLayout == loginPanel4)
			loginPanel4.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, loginPanel4, true));
		if (openLayout == loginPanel5)
			loginPanel5.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, loginPanel5, true));
		if (openLayout == pwPanel1)
			pwPanel1.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, pwPanel1, true));
		if (openLayout == pwPanel2)
			pwPanel2.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, pwPanel2, true));
		if (openLayout == startPanel1)
			startPanel1.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, startPanel1, true));
		if (openLayout == startPanel2)
			startPanel2.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, startPanel2, true));
		if (openLayout == startPanel3)
			startPanel3.startAnimation(new ScaleAnimToHide(1.0f, 1.0f, 1.0f, 0.0f,
					500, startPanel3, true));
	}

	private void hideOthers(View layoutView) {
		{
			int v;
			if (layoutView.getId() == R.id.loginText1) {
				v = loginPanel1.getVisibility();
				if (v != View.VISIBLE) {
					loginPanel1.setVisibility(View.VISIBLE);
					Log.v("CZ", "height..." + loginPanel1.getHeight());
				}

				// panel1.setVisibility(View.GONE);
				// Log.v("CZ","again height..." + panel1.getHeight());
				hideThemAll();
				if (v != View.VISIBLE) {
					loginPanel1.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, loginPanel1, true));
				}
			} else if (layoutView.getId() == R.id.loginText2) {
				v = loginPanel2.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					loginPanel2.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, loginPanel2, true));
				}
			} else if (layoutView.getId() == R.id.loginText3) {
				v = loginPanel3.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					loginPanel3.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, loginPanel3, true));
				}
			} else if (layoutView.getId() == R.id.loginText4) {
				v = loginPanel4.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					loginPanel4.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, loginPanel4, true));
				}
			} else if (layoutView.getId() == R.id.loginText5) {
				v = loginPanel5.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					loginPanel5.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, loginPanel5, true));
				}
			} else if (layoutView.getId() == R.id.pwText1) {
				v = pwPanel1.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					pwPanel1.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, pwPanel1, true));
				}
			} else if (layoutView.getId() == R.id.pwText2) {
				v = pwPanel2.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					pwPanel2.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, pwPanel2, true));
				}
			} else if (layoutView.getId() == R.id.startText1) {
				v = startPanel1.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					startPanel1.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, startPanel1, true));
				}
			} else if (layoutView.getId() == R.id.startText2) {
				v = startPanel2.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					startPanel2.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, startPanel2, true));
				}
			} else if (layoutView.getId() == R.id.startText3) {
				v = startPanel3.getVisibility();
				hideThemAll();
				if (v != View.VISIBLE) {
					startPanel3.startAnimation(new ScaleAnimToShow(1.0f, 1.0f, 1.0f,
							0.0f, 500, startPanel3, true));
				}
			} 
		}
	}

	public class ScaleAnimToHide extends ScaleAnimation {

		private View mView;

		private LayoutParams mLayoutParams;

		private int mMarginBottomFromY, mMarginBottomToY;

		private boolean mVanishAfter = false;

		public ScaleAnimToHide(float fromX, float toX, float fromY, float toY,
				int duration, View view, boolean vanishAfter) {
			super(fromX, toX, fromY, toY);
			setDuration(duration);
			openLayout = null;
			mView = view;
			mVanishAfter = vanishAfter;
			mLayoutParams = (LayoutParams) view.getLayoutParams();
			int height = mView.getHeight();
			mMarginBottomFromY = (int) (height * fromY)
					+ mLayoutParams.bottomMargin - height;
			mMarginBottomToY = (int) (0 - ((height * toY) + mLayoutParams.bottomMargin))
					- height;

			Log.v("CZ", "height..." + height + " , mMarginBottomFromY...."
					+ mMarginBottomFromY + " , mMarginBottomToY.."
					+ mMarginBottomToY);
		}

		@Override
		protected void applyTransformation(float interpolatedTime,
				Transformation t) {
			super.applyTransformation(interpolatedTime, t);
			if (interpolatedTime < 1.0f) {
				int newMarginBottom = mMarginBottomFromY
						+ (int) ((mMarginBottomToY - mMarginBottomFromY) * interpolatedTime);
				mLayoutParams.setMargins(mLayoutParams.leftMargin,
						mLayoutParams.topMargin, mLayoutParams.rightMargin,
						newMarginBottom);
				mView.getParent().requestLayout();
				// Log.v("CZ","newMarginBottom..." + newMarginBottom +
				// " , mLayoutParams.topMargin..." + mLayoutParams.topMargin);
			} else if (mVanishAfter) {
				mView.setVisibility(View.GONE);
			}
		}
	}

	public class ScaleAnimToShow extends ScaleAnimation {

		private View mView;

		private LayoutParams mLayoutParams;

		private int mMarginBottomFromY, mMarginBottomToY;

		private boolean mVanishAfter = false;

		public ScaleAnimToShow(float toX, float fromX, float toY, float fromY,
				int duration, View view, boolean vanishAfter) {
			super(fromX, toX, fromY, toY);
			openLayout = view;
			setDuration(duration);
			mView = view;
			mVanishAfter = vanishAfter;
			mLayoutParams = (LayoutParams) view.getLayoutParams();
			mView.setVisibility(View.VISIBLE);
			int height = mView.getHeight();
			// mMarginBottomFromY = (int) (height * fromY) +
			// mLayoutParams.bottomMargin + height;
			// mMarginBottomToY = (int) (0 - ((height * toY) +
			// mLayoutParams.bottomMargin)) + height;

			mMarginBottomFromY = 0;
			mMarginBottomToY = height;

			Log.v("CZ", ".................height..." + height
					+ " , mMarginBottomFromY...." + mMarginBottomFromY
					+ " , mMarginBottomToY.." + mMarginBottomToY);
		}

		@Override
		protected void applyTransformation(float interpolatedTime,
				Transformation t) {
			super.applyTransformation(interpolatedTime, t);
			if (interpolatedTime < 1.0f) {
				int newMarginBottom = (int) ((mMarginBottomToY - mMarginBottomFromY) * interpolatedTime)
						- mMarginBottomToY;
				mLayoutParams.setMargins(mLayoutParams.leftMargin,
						mLayoutParams.topMargin, mLayoutParams.rightMargin,
						newMarginBottom);
				mView.getParent().requestLayout();
				// Log.v("CZ","newMarginBottom..." + newMarginBottom +
				// " , mLayoutParams.topMargin..." + mLayoutParams.topMargin);
			}
		}

	}
}
