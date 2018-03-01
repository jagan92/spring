package com.sample.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.sample.dto.ConsultantVO;
import com.sample.entity.Consultant;
import com.sample.repository.ConsultantRepository;

@Service("consultantService")
public class ConsultantServiceImpl implements ConsultantService {

	@Autowired
	private ConsultantRepository consultantRepository;

	@Override
	public void saveConsultant(ConsultantVO consultantVO) {
		try {
			Consultant consultant = new Consultant();
			BeanUtils.copyProperties(consultant, consultantVO);
			consultantRepository.save(consultant);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Override
	public Consultant getConsultant(Long consultant) {
		return consultantRepository.getOne(consultant);

	}

	@Override
	public ConsultantVO getConsultantVO(Long consultantId) {
		Consultant consultant = consultantRepository.findOne(consultantId);
		ConsultantVO consultantVO = new ConsultantVO(consultant);
		return consultantVO;
	}

	@Override
	public List<ConsultantVO> getAllConsultant() {
		List<ConsultantVO> consultantVOs = new ArrayList<>();
		List<Consultant> consultants = consultantRepository.findAll();
		for (Consultant consultant : consultants) {
			ConsultantVO consultantVO = new ConsultantVO(consultant);
			consultantVOs.add(consultantVO);
		}
		return consultantVOs;
	}

	@Override
	public void deleteConsultant(Long consultantId) {
		try {
			Consultant consultant = consultantRepository.findOne(consultantId);
			consultantRepository.delete(consultant);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Override
	@org.springframework.transaction.annotation.Transactional(readOnly = true)
	public void mailConsultant(Long consultantId) {

		try {
			Consultant consultant = consultantRepository.findOne(consultantId);
			String strMailBody = consultant.geta_first_name() + ", Bank Name:"+consultant.getbank_name();
			final String fromEmail = "dineshk423@gmail.com"; // requires valid gmail id
			final String password = "dinesh@1995"; // correct password for gmail id
			final String toEmail = "mnjrobin@gmail.com"; // can be any email id

			System.out.println("TLSEmail Start");
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
			props.put("mail.smtp.port", "587"); // TLS Port
			props.put("mail.smtp.auth", "true"); // enable authentication
			props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS

			// create Authenticator object to pass in Session.getInstance argument
			Authenticator auth = new Authenticator() {
				// override the getPasswordAuthentication method
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			};
			Session session = Session.getInstance(props, auth);

			// EmailUtil.sendEmail(session, toEmail, "TLSEmail Testing Subject", "TLSEmail
			// Testing Body");

			String subject = "mnjrobin@gmail.com", body = strMailBody;
			try {
				MimeMessage msg = new MimeMessage(session);
				// set message headers
				msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
				msg.addHeader("format", "flowed");
				msg.addHeader("Content-Transfer-Encoding", "8bit");

				msg.setFrom(new InternetAddress("no_reply@journaldev.com", "NoReply-JD"));

				msg.setReplyTo(InternetAddress.parse("no_reply@journaldev.com", false));

				msg.setSubject(subject, "UTF-8");

				msg.setText(body, "UTF-8");

				msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
				System.out.println("Message is ready");
				Transport.send(msg);

				System.out.println("EMail Sent Successfully!!");
			} catch (Exception e) {
				e.printStackTrace();
			}

			/*
			 * String smtpHostServer = "smtp.gmail.com"; String emailID =
			 * "mnjrobin@gmail.com";
			 * 
			 * String toEmail = emailID, subject = "mnjrobin@gmail.com", body =
			 * "mnjrobin@gmail.commnjrobin@gmail.com"; final String fromEmail =
			 * "dinesh423@gmail.com", password = "dinesh@1995";
			 * 
			 * Properties props = System.getProperties();
			 * 
			 * props.put("mail.smtp.host", smtpHostServer); props.put("mail.smtp.user",
			 * fromEmail); props.put("mail.smtp.debug", "true");
			 * 
			 * props.put("mail.smtp.port", "587"); // TLS Port props.put("mail.smtp.auth",
			 * "true"); // enable authentication props.put("mail.smtp.starttls.enable",
			 * "true"); // enable STARTTLS //props.put("mail.smtp.ssl.trust",
			 * "smtp.gmail.com");
			 * 
			 * // create Authenticator object to pass in Session.getInstance argument
			 * Authenticator auth = new Authenticator() { // override the
			 * getPasswordAuthentication method protected PasswordAuthentication
			 * getPasswordAuthentication() { return new PasswordAuthentication(fromEmail,
			 * password); } }; Session session = Session.getInstance(props, auth);
			 * 
			 * MimeMessage msg = new MimeMessage(session); // set message headers
			 * msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			 * msg.addHeader("format", "flowed"); msg.addHeader("Content-Transfer-Encoding",
			 * "8bit");
			 * 
			 * msg.setFrom(new InternetAddress(fromEmail, "NoReply-JD"));
			 * msg.setSubject(subject, "UTF-8"); msg.setText(body, "UTF-8");
			 * msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail,
			 * false));
			 * 
			 * System.out.println("Message is ready");
			 * 
			 * Transport.send(msg);
			 * 
			 * System.out.println("EMail Sent Successfully!!");
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	


}
